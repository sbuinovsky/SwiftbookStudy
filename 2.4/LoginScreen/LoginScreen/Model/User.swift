//
//  User.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import Foundation
import UIKit

class User {
    var firstName = ""
    var lastName = ""
    var email = ""
    var web = ""
    var phone = ""
    
    var avatar: UIImage?
    var login = ""
    var password = ""
    
    var projects: [Project]?
    var skills: [Skill]?
    
    var shortName: String {
        firstName + " " + lastName
    }
   
    
    //MARK: - Methods
    
    func configureUser() {
        firstName = "Root"
        lastName = "Toor"
        email = "root@toor.com"

        avatar = UIImage(named: "avatar")
        login = "root"
        password = "toor"
        
        let project = Project()
        projects = project.getProjects()
        
        let skill = Skill()
        skills = skill.getSkills()
    }

}
