//
//  UINavigationBar+extentions.swift
//  Cars
//
//  Created by Msheikh on 11/15/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit
extension UINavigationBar{
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 100.0)
    }

    
}
