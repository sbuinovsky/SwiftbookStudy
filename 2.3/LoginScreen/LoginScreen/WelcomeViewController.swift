//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 25.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var login: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome " + (login ?? "")
    }
    
}
