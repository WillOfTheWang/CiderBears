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
    var Handle: DatabaseHandle?
    
    @IBOutlet weak var NAme: UITextField!
    @IBOutlet weak var EnteredCode: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        ref = Database.database().reference()
        Handle = ref?.child(EnteredCode.text!).observe(.value, with: { (snapshot) in
            if snapshot.exists() {
                self.ref?.child(self.EnteredCode.text!).child(self.NAme.text!).child("lat").setValue("what")
                self.ref?.child(self.EnteredCode.text!).child(self.NAme.text!).child("lon").setValue("what")
                
            }
        })
    

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as! MapViewController
        mapVC.code = String(EnteredCode.text!)
        mapVC.name = NAme.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if let connected = snapshot.value as? Bool, connected {
                print("Connected")
            } else {
                print("Not connected")
            }
        })

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
