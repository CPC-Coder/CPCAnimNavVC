//
//  ViewController.swift
//  myTest
//
//  Created by 鹏程 on 17/6/1.
//  Copyright © 2017年 CPC-Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate {

    
    fileprivate lazy var imgV: UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        imgV.frame = CGRect(x: 0, y: 100, width: kScreenW, height: 300)
        view.addSubview(imgV)
        imgV.image = UIImage(named: "0")
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(click))
        imgV.isUserInteractionEnabled = true
        imgV.addGestureRecognizer(tap)
        
        
        view.backgroundColor = UIColor.randomColor()
        
        
    }
    
    

    
    
    
    
    func click() -> () {
        
        
        
        let vc = ViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
   


}

