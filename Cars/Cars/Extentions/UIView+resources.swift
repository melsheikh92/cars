//
//  UIView+resources.swift
//  Runner
//
//  Created by Msheikh on 10/15/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
extension UIView{
    
    func toCircular (){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width/2
    }
    
    func installBorder(with color:UIColor , width:Float){
        layer.borderWidth = CGFloat(width)
        layer.borderColor = color.cgColor
    }
    
    func installShadow(with color:UIColor) {
        layer.cornerRadius = 2
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.45
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 1.0
    }
    
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
