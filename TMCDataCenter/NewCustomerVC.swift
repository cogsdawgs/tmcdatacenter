//
//  NewCustomerVC.swift
//  TMCDataCenter
//
//  Created by Michael C on 10/21/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import UIKit
import Firebase

class NewCustomerVC: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var oilWgtTextField: UITextField!
    @IBOutlet weak var oilAmtTextField: UITextField!
    @IBOutlet weak var oilFilterTextField: UITextField!
    
    
    var custID: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createUserPressed(_ sender: AnyObject) {
        //test if text fields are empty and create error message if no text exists
        if ((firstNameTextField.text?.isEmpty)! && (lastNameTextField.text?.isEmpty)!){
            Utilities().ShowAlert(title: "Error", message: "Please enter names before continuing", vc: self)
            return
        } else {
            //declaring them all as strings to ensure they fit the data model types
            let firstName = firstNameTextField.text! as String
            let lastName = lastNameTextField.text! as String
            let street = streetTextField.text! as String
            let city = cityTextField.text! as String
            let zip = zipTextField.text! as String
            let st = stateTextField.text! as String
            let custData = ["firstName": firstName, "lastName": lastName, "street": street, "city": city, "st": st, "zip": zip]
            self.custID = DataService.ds.createNewCustomer(custData: custData)
            
            let year = yearTextField.text! as String
            let make = makeTextField.text! as String
            let model = modelTextField.text! as String
            let oilWgt = oilWgtTextField.text! as String
            let oilAmt = oilAmtTextField.text! as String
            let oilFilter = oilFilterTextField.text! as String
            let vehicleData = ["year" : year, "make": make, "model" : model, "oilWgt" : oilWgt, "oilAmt": oilAmt, "oilFilter" : oilFilter, "customerID" : self.custID]
            DataService.ds.createNewVehicle(vehicleData: vehicleData as! [String : String])
        
            firstNameTextField.text = ""
            lastNameTextField.text = ""
            cityTextField.text = ""
            streetTextField.text = ""
            zipTextField.text = ""
            stateTextField.text = ""
            yearTextField.text = ""
            oilWgtTextField.text = ""
            oilAmtTextField.text = ""
            oilFilterTextField.text = ""
            makeTextField.text = ""
            modelTextField.text = ""
            
            
            
            
            
            
        }
    }
    
   
    
}
