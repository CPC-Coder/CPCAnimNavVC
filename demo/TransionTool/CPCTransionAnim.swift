//
//  CPCRandomTransition.swift
//  myTest
//
//  Created by 鹏程 on 17/8/7.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

class CPCTransionAnim: CPCBaseVCTransition{

    fileprivate var transitionContext : UIViewControllerContextTransitioning!
    
    
    fileprivate var toViewC:UIViewController?
    
    override func config(container: UIView, fromView: UIView, toView: UIView, initalFrame: CGRect, transitionContext: UIViewControllerContextTransitioning) -> (UIView?, UIView?) {
        
        
        
        
        if operation == .push {
            //去除tabbar动画
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as UIViewController
            fromVC.tabBarController?.tabBar.isHidden = true
        } else {
            //去除tabbar动画
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as UIViewController
            toVC.tabBarController?.tabBar.isHidden = true
        }
        return (fromView,toView)
    }
    
    override func animation(container: UIView, fromView: UIView?, toView: UIView?, transitionContext: UIViewControllerContextTransitioning) {
        
        
        self.transitionContext = transitionContext
        
        
        
        let anim = container.layer.c_getTransition(type: .random, subType: .random, curve: .random, duration: Float(duration))
        anim.isRemovedOnCompletion = true
        anim.delegate = self
        container.layer.add(anim, forKey: nil)
        
        
        //去除tabbar动画
        toViewC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as UIViewController
        

    }
   
    
}
extension CPCTransionAnim:CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        
        if operation == .pop
        {
            toViewC?.tabBarController?.tabBar.isHidden = false
        }
        
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
}
