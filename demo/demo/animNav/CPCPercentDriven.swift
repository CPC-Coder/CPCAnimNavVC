//
//  CPCPercentDriven.swift
//  myTest
//
//  Created by 鹏程 on 17/8/7.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

open class CPCPercentDriven: UIPercentDrivenInteractiveTransition {
    
    
    open var c_value:CPCPercentDriven?{
        return isInteracting ? self : nil
    }
    open var gesture:UIPanGestureRecognizer? {
        didSet{
            gesture?.addTarget(self, action: #selector(c_handleNavigationTransition))
        }
    }
    open var vc: UIViewController?
    
    fileprivate var isInteracting : Bool = false
    
    

    
    
    
    
    //MARK: - *** 手势事件(计算百分比) ***
    @objc fileprivate func c_handleNavigationTransition(pan: UIPanGestureRecognizer) -> () {
        
        
        
        
        //  百分比 x/kScreenW
        let progress = abs(pan.translation(in: UIApplication.shared.keyWindow!).x) / UIApplication.shared.keyWindow!.bounds.width
        
        
        
        
        switch pan.state {
        case UIGestureRecognizerState.began:
            isInteracting = true
           _ = vc?.navigationController?.popViewController(animated: true)
            
        case UIGestureRecognizerState.changed:
            
            update(progress)
            
        case UIGestureRecognizerState.cancelled,UIGestureRecognizerState.ended:
            
            if progress > 0.5 {
                finish()
            } else {
                cancel()
            }
            
            isInteracting = false
            
        default:
            return
        }
        
        
    }
    
    
    
}
