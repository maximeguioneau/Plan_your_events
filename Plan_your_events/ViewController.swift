//
//  ViewController.swift
//  Plan_your_events
//
//  Created by Maxime Guioneau on 09/06/2015.
//  Copyright (c) 2015 Maxime Guioneau. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts

class ViewController: UIViewController {
    
    var facebookid: NSString = ""
    var username: NSString = ""
    var userEmail:NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if PFUser.currentUser() != nil {
            println("User Logged In")
            self.performSegueWithIdentifier("goToListEvent", sender: self)
        } else {
            println("User Not Logged In")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func registerWithFacebook(sender: UIButton) {
        
        var permissions = ["public_profile", "email", "user_friends"]
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions,  block: {  (user: PFUser?, error: NSError?) -> Void in
            
            if let user = user {
                
                if user.isNew {
                    
                    println("User signed up and logged in through Facebook!")
                    
                    self.performSegueWithIdentifier("goToListEvent", sender: self)
                    
                } else {
                    
                    println("User logged in through Facebook!")
                    self.loadData()
                    self.performSegueWithIdentifier("goToListEvent", sender: self)
                    
                }
                
            } else {
                
                println("Uh oh. The user cancelled the Facebook login.")
                
            }
            
        })
        
    }
    
    func loadData(){
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                
                self.facebookid = result.valueForKey("id") as! NSString!
                self.username = result.valueForKey("name") as! NSString!
                self.userEmail = result.valueForKey("email") as! NSString!
                println(result) // This works
                
                
            }
        })
        
    }
    
    




}

