//
//  User.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import Foundation
import UIKit

class User {
    var firstName: String
    var lastName: String
    var email: String
    var web: String
    var phone: String
    
    let avatar: UIImage?
    let login: String
    let password: String
    
    var projects: [Project]
    var skills: [Skill]
    
    var shortName: String {
        firstName + " " + lastName
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.web = ""
        self.phone = ""
        self.avatar = UIImage(named: "avatar")
        self.login = "root"
        self.password = "toor"
        self.projects = []
        self.skills = []
    }
    
    
    //MARK: - Methods
    func addProject(_ project: Project) {
        projects.append(project)
    }
    
    
    func addSkill(_ skill: Skill) {
        skills.append(skill)
    }

    
    func configureUser() {
        self.firstName = "Root"
        self.lastName = "Toor"
        self.email = "root@toor.com"

        for counter in 0...10 {
            let project = Project(title: "Some project \(counter)",
                                  description: "Description of some project \(counter)")
            let skill = Skill(title: "Some skill \(counter)",
                              description: "Description of some skill \(counter)")
            
            addProject(project)
            addSkill(skill)
        }
    }

}
