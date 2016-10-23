//
//  Utilities.swift
//  TMCDataCenter
//
//  Created by Michael C on 10/22/16.
//  Copyright © 2016 Michael C. All rights reserved.
//

import Foundation
import UIKit


class Utilities {
    
    //allows for pop ups to be easily created by a single line of code all over program
    func ShowAlert (title: String, message: String, vc: UIViewController)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    
    //grabs and formats current date - can be called anywhere to add date details to other steps later on eg when a service is started, etc
    func getDate() -> String {
        let today: Date = Date()
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MM-DD-YYYY  HH:MM"
        return formatter.string(from: today)
    }
    
    
    
    
    
}
