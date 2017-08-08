//
//  TransionTool.swift
//  demo
//
//  Created by 鹏程 on 17/8/8.
//  Copyright © 2017年 鹏程. All rights reserved.
//

import UIKit
enum TransionAnimType{
    case filp,transionAnim
    
}
class TransionTool: NSObject,UINavigationControllerDelegate {

    open static let share = TransionTool()
    open var animType : TransionAnimType = .filp
    open var duration : TimeInterval = 0.8
    
    
    
    fileprivate lazy var percentDrivenTransition : CPCPercentDriven = CPCPercentDriven()
    
    //push pop 给动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        
        if let interactivePopGes = (fromVC as? UINavigationController)?.interactivePopGestureRecognizer as? UIPanGestureRecognizer {
            
            
            let targetArr = interactivePopGes.value(forKey: "targets") as! [AnyObject]
            let target = targetArr.last?.value(forKey: "target")
            let sel = Selector(("handleNavigationTransition:"))
            
            //移除原来手势方法
            interactivePopGes.removeTarget(target, action: sel)
            
            //添加自己的方法
            percentDrivenTransition.vc = fromVC
            percentDrivenTransition.gesture = interactivePopGes
            
        }
        
        
        switch animType {
        case .filp:
            return CPCFlipTransion(operation: operation, duration: duration)
        case .transionAnim:
            return CPCTransionAnim(operation: operation, duration: duration)
        
        }

        
        
        
        
        
    }
    
    
    
    // 控制动画进度   (通过计算手势滑动的距离)
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        
        
        return percentDrivenTransition.c_value
    }
    
    
}
