//
//  LoginViewController.swift
//  Groove
//
//  Created by Benjamin Kodres-O'Brien on 7/30/15.
//  Copyright (c) 2015 Benjamin Kodres-O'Brien. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if FBSDKAccessToken.currentAccessToken() != nil {
            let rvc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("NavigationController") as! UINavigationController
            self.presentViewController(rvc, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton(frame: CGRectMake(0, 0, 250, 50))
        loginButton.center = self.view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: FBSDKLoginButtonDelegate {
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if let error = error {
            println(error.localizedDescription)
            let alert = UIAlertController(title: "Login Error", message: "Could not login to facebook.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(
                title: "Dismiss",
                style: UIAlertActionStyle.Default,
                handler: { action in
                    let rvc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("NavigationController") as! UINavigationController
                    self.presentViewController(rvc, animated: true, completion: nil)
                })
            )
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let rvc = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("NavigationController") as! UINavigationController
        presentViewController(rvc, animated: true, completion: nil)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        // logout handled elsewhere
    }
}
