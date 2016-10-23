//
//  LoginVC.swift
//  TMCDataCenter
//
//  Created by Michael C on 10/20/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import UIKit
import Firebase


class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func loginButtonPressed(_ sender: AnyObject) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error != nil {
                    print("There's been an error logging in ####")
                } else {
                    print("Success ####")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }
                
            })
            
            
            
        }
        
        
        
        
        
        
    }

}

