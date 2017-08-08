//
//  CPCBaseVCAnimatedTransitioning.swift
//  myTest
//
//  Created by 鹏程 on 17/8/7.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

open class CPCBaseVCTransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    
    open var operation: UINavigationControllerOperation
    open var duration: TimeInterval
    init(operation: UINavigationControllerOperation,duration: TimeInterval) {
        self.operation = operation
        self.duration = duration
        super.init()
    }
    
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        
        
        return duration
    }
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        
        //源vc
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as UIViewController
        //源view
        guard let fromView = fromVC.view else{ return }
        //初始化frame
        let initalFrame = transitionContext.initialFrame(for: fromVC)

        //目标view
        guard  let toView = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as UIViewController).view
            else { return }
        //容器view
        let container = transitionContext.containerView

        fromView.frame = initalFrame
        toView.frame = initalFrame
        
        
        container.addSubview(fromView)
        container.addSubview(toView)
        
        
        /*------------      开始    ------------ */
        
        //返回(已经配置好的fromView和toView)
        let twoView = config(container: container, fromView: fromView, toView: toView, initalFrame: initalFrame,transitionContext: transitionContext)
        //container 添加view
        add(container: container, twoView: twoView)
        
        
        //要执行的动画
        animation(container: container, fromView: twoView.0, toView: twoView.1, transitionContext: transitionContext)
        
    }
    
    
    
    /**
     返回(已经配置好的fromView和toView)
     */
    open func config(container:UIView,fromView: UIView,toView: UIView,initalFrame:CGRect,transitionContext: UIViewControllerContextTransitioning) -> (UIView?,UIView?) {
        
        


        return (fromView,toView)
    }
    
    /**
     container 添加view
     */
    fileprivate func add(container:UIView,twoView:(UIView?,UIView?)){
        
        
        
            if let fromV = twoView.0 {
                container.addSubview(fromV)
            }
            
            if let toV = twoView.1 {
                container.addSubview(toV)
            }

        
        
    }
    
    /**
     要执行的动画
     */
    open func animation(container:UIView,fromView: UIView? ,toView: UIView?,transitionContext: UIViewControllerContextTransitioning){
        
    }
    
    
    
}
