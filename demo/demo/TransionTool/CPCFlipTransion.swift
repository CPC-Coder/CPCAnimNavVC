//
//  CPCFlipTransion.swift
//  myTest
//
//  Created by 鹏程 on 17/8/7.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

class CPCFlipTransion: CPCBaseVCTransition {
    
  

    
    
    
    override func config(container: UIView, fromView: UIView, toView: UIView, initalFrame: CGRect,transitionContext: UIViewControllerContextTransitioning) -> (UIView?, UIView?) {
        
        
        //改变m34
        var transfrom = CATransform3DIdentity
        transfrom.m34 = -0.002
        container.layer.sublayerTransform = transfrom
        
        
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as UIViewController
        
        
        if operation == .push {
            
            //去除tabbar动画
            fromVC.tabBarController?.tabBar.isHidden = true
            
            
            let fromImgView = UIImageView()
            fromImgView.image = fromVC.tabBarController?.view.c_snapshotImage()
            fromImgView.frame = UIScreen.main.bounds
            
            //设置anrchPoint 和 position
            
            fromImgView.layer.anchorPoint = CGPoint(x: 0, y: 0)
            fromImgView.layer.position = CGPoint(x: 0, y: 0)
            
            
            return (fromImgView,toView)
            
            
            
        
            
            
            
        } else {
            
            //去除tabbar动画
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as UIViewController
            toVC.tabBarController?.tabBar.isHidden = true
            
            
            
            let toImgView = UIImageView()
            toImgView.image = toVC.view.c_snapshotImage()
            toImgView.frame = initalFrame
            
            //
            toImgView.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
            toImgView.layer.position = CGPoint(x: 0, y: initalFrame.height/2.0)
            toImgView.layer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_2), 0, 1, 0)

            
            
            return (fromView,toImgView)
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
 
    
    
    
    
    
    
    override func animation(container: UIView, fromView: UIView?, toView: UIView?, transitionContext: UIViewControllerContextTransitioning) {
        
        

        
        if operation == .push {//push
            
            container.bringSubview(toFront: fromView!)
            
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                fromView?.layer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_2), 0, 1, 0)
                
            }) { (finished: Bool) -> Void in
                //完成动画后  1恢复anrchPoint 和 position
                
                fromView?.removeFromSuperview()
                
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {//pop
            
            container.bringSubview(toFront: toView!)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                toView?.layer.transform = CATransform3DIdentity
                
                
            }) { (finished: Bool) -> Void in
                
                //去除tabbar动画
                let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as UIViewController
                toVC.tabBarController?.tabBar.isHidden = false
                
                toView?.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
        
        
    }

}
