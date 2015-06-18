//
//  AddEventViewController.swift
//  Plan_your_events
//
//  Created by Maxime Guioneau on 18/06/2015.
//  Copyright (c) 2015 Maxime Guioneau. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI
import Bolts

class AddEventViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var typeTextField: UITextField!
    
    
    @IBAction func addEvent(sender: AnyObject) {
        
        
        if nameTextField.text == nil {
            
            
        }
        
        else {
            
            var event = PFObject(className: "Event");
            
            event.setObject(nameTextField.text!, forKey: "name")
            event.setObject(typeTextField.text!, forKey: "type")
            
            event.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                self.performSegueWithIdentifier("unwindToThisViewController", sender: self)
                } else {
                    // There was a problem, check error.description
                }
            }
            
        }
        
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
    
    
}