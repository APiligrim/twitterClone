//
//  LoginViewController.swift
//  Twitter
//
//  Created by Albert Gertskis on 3/6/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    

    @IBAction func onLoginButton(_ sender: Any) {
        let requestTokenUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: requestTokenUrl, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Error, could not log in.")
            let title = "Error"
            let message = "An error has occured. Unable to log-in."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
