//
//  CreateViewController.swift
//  Herd
//
//  Created by Yunfang Xiao on 11/3/18.
//  Copyright © 2018 Draphix. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {
    var database = [Int]()
    
    var ref:DatabaseReference?

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Code: UILabel!
    
    
    @IBAction func Enter(_ sender: Any) {
        ref = Database.database().reference()
        let C = Code.text
        ref?.child(C!).child(Name.text!).setValue("location")
        Name.text = ""
        Code.text = ""
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("HI")
        
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if let connected = snapshot.value as? Bool, connected {
                print("Connected")
            } else {
                print("Not connected")
            }
        })
        
        // Do any additional setup after loading the view.
        var random = Int(arc4random_uniform(100000))
        while(database.contains(random)) {
            random = Int(arc4random_uniform(100000))
        }
        database.append(random)
        Code.text = String(random)
        
    }
/**
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
