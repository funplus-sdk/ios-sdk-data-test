//
//  ViewController.swift
//  DataTestApp
//
//  Created by Yuankun Zhang on 6/2/16.
//  Copyright © 2016 funplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uidText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: AnyObject) {
        if uidText.text != nil {
//            AccountManager.sharedInstance.login(text)
        } else {
            // TODO trace error
        }
    }
    
    @IBAction func onLogout(_ sender: AnyObject) {
//        AccountManager.sharedInstance.logout()
    }
    
    @IBAction func onPayment(_ sender: AnyObject) {
    }
    
}

