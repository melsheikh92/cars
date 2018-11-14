//
//  BaseViewController.swift
//  Runner
//
//  Created by Msheikh on 9/20/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import UIKit
import JGProgressHUD
import MJSnackBar
class BaseViewController: UIViewController {
    let hud = JGProgressHUD(style: .dark)
    var snackBar: MJSnackBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.installShadow(with: UIColor.black)
        hud.textLabel.text = "Loading"
        snackBar = MJSnackBar(onView: self.view)
    }
    override func viewWillAppear(_ animated: Bool) {
       
   
}
    override func viewDidAppear(_ animated: Bool) {
        hud.textLabel.text = "Loading"
        snackBar = MJSnackBar(onView: self.view)

       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func showLoadingDialog(){
       
        hud.show(in: self.view)
    }
    func hideLoadingDialog()  {
        hud.dismiss(afterDelay: 3.0)
        
    }
    func showSnackBar(msg:String){
        let data = MJSnackBarData(withIdentifier: 12, message: msg, andActionMessage: nil, objectSaved: nil)
        snackBar?.show(data: data, onView: self.view)
        
    }
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    func pushWebViewController(url:String , title:String, contentType: WebViewContentType) {
        let    storyboard = UIStoryboard(name: "Book", bundle: nil)
        let    vc = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.stringUrl = url
        vc.eduKit_title = title
        vc.contentTyp = contentType
        navigationController?.pushViewController(vc, animated: true)
    }
    func installBackImg(){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
       
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
