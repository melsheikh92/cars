//
//  UIStoryboard.swift
//  Cars
//
//  Created by Msheikh on 11/28/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import UIKit

enum Storyboards: String {
    case main = "Main"
    
    var sbObject:UIStoryboard {
        return UIStoryboard(name: self.rawValue)
    }
}


extension UIStoryboard{
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
}
