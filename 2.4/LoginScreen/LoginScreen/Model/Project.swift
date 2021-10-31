//
//  Project.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import Foundation

class Project {
    
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
    func getProjects() -> [Project] {
        var projects: [Project] = []
        for counter in 0...10 {
            let project = Project(title: "Some project \(counter)",
                                  description: "Description of some project \(counter)")
            projects.append(project)
        }
        return projects
    }
    
}
