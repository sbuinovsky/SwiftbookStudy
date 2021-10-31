//
//  AboutController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import UIKit

class AboutController: UIViewController {

    var user: User?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var web: UILabel!
    @IBOutlet weak var skills: UILabel!
    @IBOutlet weak var projects: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let userData = user else { return }
        
        avatar.image = userData.avatar
        shortName.text = "Full name: \(userData.shortName)"
        email.text = "email: \(userData.email)"
        web.text = "web: \(userData.web)"
        skills.text = "Number of skills: \(userData.skills?.count ?? 0)"
        projects.text = "Number of projects: \(userData.projects?.count ?? 0)"
    }
    
}
