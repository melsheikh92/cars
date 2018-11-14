//
//  ApiHelper.swift
//  Runner
//
//  Created by Msheikh on 9/23/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
import RxSwift
import AlamofireObjectMapper
import Alamofire
import RxAlamofire
import RxAlamofire_ObjectMapper
class ApiHelper<T:BaseModel> {
    
    func CallApi( apiUrl:String , method:HTTPMethod, parameters: [String: Any]? ,observer: PublishSubject<T> ){
        var headers:[String:String] = [String:String]()
        headers["Authorization"] = "Bearer \(UserData.instance.token!)"
        headers["Content-Type"] = "application/json"
        
        let url = "\(UserData.instance.baseUrl!)\(apiUrl)"
        Alamofire.request( url, method:method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseObject { (response: DataResponse<T>) in
            if let data = response.data {
                print(String(data: data, encoding: String.Encoding.utf8))
            }
            
            guard response.result.isSuccess else {
                print("error calling \(apiUrl)")
                observer.onError(response.error!)
                return
            }
            
            guard let result = response.result.value else {
                print("error calling \(apiUrl)")
                observer.onError(response.error!)
                return
            }
            observer.onNext(result)
            
        }
    }
    func rxCallApi( apiUrl:String , method:HTTPMethod, parameters: [String: Any] ,observer: PublishSubject<T> ){
        var headers:[String:String] = [String:String]()
        headers["Authorization"] = "Bearer \(UserData.instance.token!)"
        headers["Content-Type"] = "application/json"
        let url = "\(UserData.instance.baseUrl!)\(apiUrl)"
        Alamofire.request(url, method:method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).rx.responseMappable(as: T.self).subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background)).observeOn(MainScheduler.instance).subscribe(observer).disposed(by: DisposeBag())
    }
}
