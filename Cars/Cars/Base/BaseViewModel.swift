//
//  BaseViewModel.swift
//  Runner
//
//  Created by Msheikh on 9/20/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
protocol VieWModelType{
    func doOnDidLoad()
    func doOnWillAppear()
    func doOnViewDidAppear()
    func doOnViewDidDisappear()
    
}
