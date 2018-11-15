//
//  ViewController.swift
//  Cars
//
//  Created by Msheikh on 11/14/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackviewNav: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.stackviewNav.separatorColor = UIColor(named: "grayColor")
        self.stackviewNav.separatorLength = 25.0
        self.stackviewNav.separatorThickness = 1.0
   
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       

    }

}

