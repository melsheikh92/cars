//
//  BaseModel.swift
//  Runner
//
//  Created by Msheikh on 9/20/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
import ObjectMapper
class BaseChatModel: Mappable{
    var process_time:String?
    var total_records:Int?
    var error_code:String?
    var error_message:String?
    var server_time:String?
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        process_time <- map["process_time"]
        total_records  <- map["total_records"]
        error_code  <- map["error_code"]
        error_message  <- map["error_message"]
        server_time  <- map["server_time"]
    }
}
