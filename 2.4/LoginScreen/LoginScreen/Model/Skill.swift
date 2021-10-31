//
//  Skill.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import Foundation

class Skill {
    
    let title: String
    let description: String
    
    
    init(title: String, description: String) {
        self.title = title
        self.description = title
    }
    
    
    init() {
        self.title = ""
        self.description = ""
    }
    
    
    //MARK: - Methods
    func getSkills() -> [Skill] {
        var skills: [Skill] = []
        for counter in 0...10 {
            let skill = Skill(title: "Some skill \(counter)",
                              description: "Description of some skill \(counter)")
            skills.append(skill)
        }
        return skills
    }
}
