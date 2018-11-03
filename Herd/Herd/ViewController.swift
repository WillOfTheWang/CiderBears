//
//  ViewController.swift
//  Herd
//
//  Created by William W. on 11/3/18.
//  Copyright © 2018 Draphix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func UserName(_ sender: UITextField) {
    }
    
    @IBAction func Code(_ sender: UITextField) {
        var random: Int
        var database = [Int]()
        random = 0
        random = Int(arc4random_uniform(100))
        while(database.contains(random)) {
            random = Int(arc4random_uniform(100))
        }
        sender.text = String(random)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

