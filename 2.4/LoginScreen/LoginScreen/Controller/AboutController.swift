//
//  AboutController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import UIKit

class AboutController: UIViewController {

    var user: User!
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var web: UILabel!
    @IBOutlet weak var skills: UILabel!
    @IBOutlet weak var projects: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.image = user.avatar
        shortName.text = "Full name: \(user.shortName)"
        email.text = "email: \(user.email)"
        web.text = "web: \(user.web)"
        skills.text = "Number of skills: \(user.skills?.count ?? 0)"
        projects.text = "Number of projects: \(user.projects?.count ?? 0)"
    }
    
}
