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
    
    
    override func animation(container: UIView, fromView: UIView?, toView: UIView?, transitionContext: UIViewControllerContextTransitioning) {
        
        
        self.transitionContext = transitionContext
        
        
        
        let anim = container.layer.c_getTransition(type: .random, subType: .random, curve: .random, duration: Float(duration))
        anim.isRemovedOnCompletion = true
        anim.delegate = self
        container.layer.add(anim, forKey: nil)
    }
   
    
}
extension CPCTransionAnim:CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    
}
