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
        
        
        //移除系统手势
        var interactivePopGes = toVC.navigationController?.interactivePopGestureRecognizer as? UIPanGestureRecognizer
        if interactivePopGes != nil{
            interactivePopGes = nil
        }
        
        //动画进度和 添加手势
        percentDrivenTransition.vc = toVC
        
        
        
        
        
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
