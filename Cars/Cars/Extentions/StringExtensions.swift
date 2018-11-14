//
//  StringExtensions.swift
//  Runner
//
//  Created by Msheikh on 10/14/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation

extension String{
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}


