//
//  UIView+CPCsnapshot.swift
//  OneAuction
//
//  Created by 鹏程 on 17/5/12.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

extension UIView{
    /// 返回视图截图
    func c_snapshotImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()

        
            UIGraphicsEndImageContext();
            
            return resultImg;
    }
    
    
}
