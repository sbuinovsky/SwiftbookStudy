//
//  ProjectController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 29.10.2021.
//

import UIKit

class ProjectController: UIViewController {

    var projectTitle = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var projectImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(projectTitle)
        titleLabel.text = projectTitle
        projectImage.image = UIImage(named: "lock_image")
    }

}
