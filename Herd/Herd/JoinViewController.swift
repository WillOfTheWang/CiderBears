//
//  JoinViewController.swift
//  Herd
//
//  Created by Yunfang Xiao on 11/3/18.
//  Copyright © 2018 Draphix. All rights reserved.
//

import UIKit
import Firebase

class JoinViewController: UIViewController {

    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    @IBOutlet weak var NAme: UITextField!
    @IBOutlet weak var EnteredCode: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        ref = Database.database().reference()
        handle = ref?.child("Groups").observe(.value, with: {snapshot in
            if let connected = snapshot.value as? Bool, connected {
                print("Connected")
            } else {
                print("Not connected")
            }
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
