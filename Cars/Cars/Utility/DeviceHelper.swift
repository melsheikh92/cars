//
//  DeviceHelper.swift
//  Runner
//
//  Created by Msheikh on 9/26/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
class DeviceHelper{
    
    static func isIpad ()-> Bool{
        return  UIDevice.current.userInterfaceIdiom == .pad ? true : false
    }
    static func isEnglish ()->Bool{
        return   NSLocale.current.languageCode?.contains("en") ?? false
    }
}
