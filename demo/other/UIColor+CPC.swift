//
//  UIColor-Extension.swift
//  DemoTest
//
//  Created by 鹏程 on 16/11/21.
//  Copyright © 2017年 鹏程. All rights reserved.
//

import UIKit



let kBGCOLOR: UIColor = UIColor(r: 244, g: 244, b: 244)

let kcommonGreen = UIColor(r: 162, g: 229, b: 97)
let kcommonRed = UIColor(r: 240, g: 76, b: 82)
let kcommonBlue = UIColor(r: 78, g: 146, b: 223)
let korange = UIColor(r: 246, g: 114, b: 56)
let kyellow = UIColor(r: 252, g: 198, b: 71)


let kNavBarH : CGFloat = 64
let ktabBarH : CGFloat = 49
let kCellLeftMar: CGFloat = 20


let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
let kScreenScale = UIScreen.main.scale

let kiphone6P_h = (kScreenH == 736)
let kiphone6_h = (kScreenH == 667)
let kiphone5_h = (kScreenH == 568)
let kiphone4_h = (kScreenH == 480)

extension UIColor {
    /// rgb颜色
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0 ,green: g/255.0 ,blue: b/255.0 ,alpha:1.0)
        
    }
    
    
    convenience init( r : CGFloat,  g : CGFloat,  b : CGFloat,  a : CGFloat) {
        
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
    
    
    
    /// 纯色（用于灰色）
    convenience init(gray: CGFloat) {
        self.init(red: gray/255.0 ,green: gray/255.0 ,blue: gray/255.0 ,alpha:1.0)
    }
    /**
     随机色
     */
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
