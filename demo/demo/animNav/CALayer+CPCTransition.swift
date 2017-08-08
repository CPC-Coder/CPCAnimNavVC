//
//  CALayer+CPCTransition.swift
//  myTest
//
//  Created by 鹏程 on 17/6/30.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import Foundation
import UIKit


/*
 *  动画类型
 */
enum  CPCTransitionAnimType:Int{
    
    
    //私有
    case pageCurl//翻开书本
    case pageUnCurl//合上书本
    //case cube//正方体
    //case oglFlip//正反翻转
    case suckEffect//吸走
    case rippleEffect //水波
    
    
    //共有
    //case fade//淡入淡出
    //case Push//推送
    //case reveal//推开
    //case Movein//移动
    
    case random//随机
}


/**
 动画方向
 */
enum CPCTransitionSubType: Int{
    case top = 0
    case right
    case left
    case bottom
    case random//随机
    
}
/*
 *  动画曲线
 */
enum CPCTransitionCurve: Int{
    case common = 0  //默认
    case easeInt // 缓进
    case easeOut //缓出
    case easeInOut //缓进缓出
    case linear //线性
    case random //随机
}


//MARK: - *** 转场动画 ***
extension CALayer{
    /**
     *  转场动画(base)
     *
     *  @param animType 转场动画类型
     *  @param subType  转动动画方向
     *  @param curve    转动动画曲线
     *  @param duration 转动动画时长
     *
     *  @return 转场动画实例
     */
    @discardableResult
    func c_transition(type:CPCTransitionAnimType ,subType: CPCTransitionSubType = .random, curve: CPCTransitionCurve = .random ,duration: Float = 0.5) -> CATransition {
        
        
        let key = "transition"
        if animation(forKey: key) != nil {
            removeAnimation(forKey: key)
        }
        
        
        //得到动画
        let transition = c_getTransition(type: type, subType: subType, curve: curve, duration: duration)
        
        
        transition.isRemovedOnCompletion = true
        add(transition, forKey: key)
        return transition
    }
    
    
    func c_getTransition(type:CPCTransitionAnimType ,subType: CPCTransitionSubType = .random, curve: CPCTransitionCurve = .random ,duration: Float = 0.5) -> CATransition{
        let transition = CATransition()
        //动画时长
        transition.duration = CFTimeInterval(duration)
        //["pageCurl","pageUnCurl","cube","oglFlip","suckEffect","rippleEffect","fade","push","reveal","movein"]
        //动画类型
        let typeArray = ["pageCurl","pageUnCurl","suckEffect","rippleEffect"]
        
        let animType = getObj(arr: typeArray, idx: type.rawValue, isRandom: CPCTransitionAnimType.random == type)
        print("\(animType)")
        transition.type = animType
        
        
        //动画方向
        let subtypeArr = [kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight]
        let animSubtype = getObj(arr: subtypeArr, idx: subType.rawValue, isRandom: CPCTransitionSubType.random == subType)
        
        transition.subtype = animSubtype
        
        
        //时间函数
        let funcNameArr = [kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear]
        let animFuncName = getObj(arr: funcNameArr, idx: curve.rawValue, isRandom: CPCTransitionCurve.random == curve)
        
        transition.timingFunction = CAMediaTimingFunction(name: animFuncName)
        return transition
    }
    
    
    
    
    /*
     *  统一从数据返回对象
     */
    fileprivate func getObj<T>(arr: Array<T>,idx: Int, isRandom: Bool ) -> T{
        
        let count = arr.count
        let i = isRandom ? (arc4random_uniform(UInt32(count))) : UInt32(idx)
        
        return arr[Int(i)]
        
    }
    


    
    
    
}










/*
 *  反转方向
 */
enum CPCAnimReverDirection: Int{
    case x = 0,y ,z ,random
}






//MARK: - *** 小动画 ***
extension CALayer{
    //MARK: - *** 翻转动画 ***
    /**
     翻转动画
     
     - parameter direction:   方向
     - parameter duration:    时长
     - parameter isReverse:   是否自动反转
     - parameter repeatCount: 重复次数
     
     - returns: anim
     */
    @discardableResult
    func c_revers(direction: CPCAnimReverDirection,duration: Float = 0.5,isReverse: Bool = false,repeatCount: UInt = 1) -> CAAnimation {
        
        let key = "reversAnim"
        if animation(forKey: key) != nil {
            removeAnimation(forKey: key)
        }
        
        let dirArr = ["x","y","z"]
        let directionStr = getObj(arr: dirArr, idx: direction.rawValue, isRandom: CPCAnimReverDirection.random == direction)
        
        let reversAnim = CABasicAnimation(keyPath: "transform.rotation.\(directionStr)")
        //起点值
        reversAnim.fromValue = 0
        //终点值
        let dire:Double = arc4random_uniform(2) == 1 ? 1 : -1
        reversAnim.toValue = M_PI*2*dire
        //时长
        reversAnim.duration = CFTimeInterval(duration)
        //自动反转
        reversAnim.autoreverses = isReverse;
        //重复次数
        reversAnim.repeatCount = Float(repeatCount);
        //完成删除
        reversAnim.isRemovedOnCompletion = true
        //reversAnim.fillMode = kCAFillModeForwards
        //添加
        add(reversAnim, forKey: key)
        return reversAnim
        
        
    }
    
    
    
    //MARK: - *** 摇动 ***
    /**
     摇动
     
     - parameter angle:       角度
     - parameter duration:    时长
     - parameter repeatCount: 重复次数
     
     - returns: anim
     */
    @discardableResult
    func c_shake(angle: Float = 0.2, duration: Float = 0.5, repeatCount: UInt = 2) -> CAAnimation {
        //创建关键帧动画
        let kfa = CAKeyframeAnimation(keyPath: "transform.rotation.z"
        )
        
        //指定值
        let arr = [-angle,0,angle,0,-angle,0,angle,0]
        kfa.values = arr
        //时长
        kfa.duration = CFTimeInterval(duration)
        //重复次数
        kfa.repeatCount = Float(repeatCount)
        //完成删除
        kfa.isRemovedOnCompletion = true
        //添加
        add(kfa, forKey: "rotation")
        return kfa
        
    }
    
    
    
    
    
    @discardableResult
    func c_scale(duration: Float = 0.8, repeatCount: UInt = 1) -> CAAnimation {
        //创建关键帧动画
        let kfa = CAKeyframeAnimation(keyPath:"transform.scale")
        
        //指定值
        let arr = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        kfa.values = arr
        //时长
        kfa.duration = CFTimeInterval(duration)
        //重复次数
        kfa.repeatCount = Float(repeatCount)
        //完成删除
        kfa.isRemovedOnCompletion = true
        //添加
        add(kfa, forKey: "scale")
        return kfa
        
        
        
        

        
    }
    
    
    
    


    
    
    
}






