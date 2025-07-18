//
//  ViewController.swift
//  MyLayoutUI
//
//  Created by 承轩 on 07/16/2025.
//  Copyright (c) 2025 承轩. All rights reserved.
//

import UIKit
import MyLayoutUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v = ZStack()
        v.backgroundColor = .red
        v.add(to: view).padding(10).size(.fill)
        
        let vs = ZStack(gravity: .around) { stack in
            
        }
           
        let temp = UIView()
        temp.backgroundColor = .green
        temp.add(to: v)
            .margin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

