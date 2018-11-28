//
//  CarsViewModel.swift
//  Cars
//
//  Created by Msheikh on 11/15/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
class CarsViewModel{

    let provider = MoyaProvider<CarsAPI>()

    
    init() {
        provider.rx.request(.cars).map(CarsResponseModel.self).subscribe { (result) in
            switch result {
            case .success(let response):
                print (response)
                
            case .error(let error):
                print(error)
            }
            
        }
    }
}
