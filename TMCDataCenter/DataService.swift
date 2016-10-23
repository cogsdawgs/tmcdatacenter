//
//  DataService.swift
//  TMCDataCenter
//
//  Created by Michael C on 10/22/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import Foundation
import Firebase

//I honestly don't know why I'm creating these references here.  It's just how it was done in a tutorial I followed.
//does declaring them here mean they're global?
let DB_BASE = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()


class DataService {
    
    //I think this is declared here just to keep my statement later on shorter.  It also means when you call the methods
    //in this class you don't have to include the empty () which I forget all the time.
    static let ds = DataService()
    
    //I declared these privately within the class and then assign them below as it was cited as a best coding practice.
    //Only one of the 5 tutorials I've followed said this, so it could be bullshit - who knows
    private var _REF_BASE = DB_BASE
    private var _REF_SERVICES = DB_BASE.child("services")
    private var _REF_VEHICLES = DB_BASE.child("vehicles")
    private var _REF_CUSTOMERS = DB_BASE.child("customers")
    
    
    //Firebase has different ways to handle storage of files
    private var _REF_POST_PICS = STORAGE_BASE.child("post-pics")
    
    
    
    
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_SERVICES: FIRDatabaseReference{
        return _REF_SERVICES
    }
    
    var REF_VEHICLES: FIRDatabaseReference{
        return _REF_VEHICLES
    }
    
    var REF_CUSTOMERS: FIRDatabaseReference {
        return _REF_CUSTOMERS
    }
    
    var REF_POST_PICS: FIRStorageReference {
        return _REF_POST_PICS
    }
    
    
    
    
    
    //creating the methods within the class instead of in the controller
    func createNewCustomer (custData: [String : String])-> String{
        
        var newCust = custData
        newCust["dateCreated"] = Utilities().getDate()
        let firebasepost = REF_CUSTOMERS.childByAutoId()
        firebasepost.setValue(newCust)
        let custID = firebasepost.key
        return custID
        
    }
    
    func createNewVehicle (vehicleData: [String: String]) {
        var newVehicle = vehicleData
        newVehicle["dateCreated"] = Utilities().getDate()
        let firebaseVehiclePost = REF_VEHICLES.childByAutoId()
        firebaseVehiclePost.setValue(newVehicle)
        
    }
    
    
    
}
