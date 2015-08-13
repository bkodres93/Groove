//
//  RootViewController.swift
//  Groove
//
//  Created by Benjamin Kodres-O'Brien on 7/30/15.
//  Copyright (c) 2015 Benjamin Kodres-O'Brien. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alert = UIAlertController(title: "Hello!", message: "Ready to groove", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Destructive, handler: nil))
        presentViewController(alert, animated: true, completion: {
            // nothing yet
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutTapped(sender: UIButton, forEvent event: UIEvent) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}

