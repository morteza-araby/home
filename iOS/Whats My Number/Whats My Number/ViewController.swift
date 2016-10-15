//
//  ViewController.swift
//  Whats My Number
//
//  Created by Morteza Araby on 2016-10-15.
//  Copyright © 2016 Morteza Araby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numberObject = UserDefaults.standard.object(forKey: "number")
        
        if let number = numberObject as?String {
            numberField.text = number
        }
    }

    @IBAction func save(_ sender: AnyObject) {
        UserDefaults.standard.set(numberField.text, forKey: "number")
    }
    
   

}

