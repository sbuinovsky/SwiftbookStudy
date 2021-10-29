//
//  SkillsController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 29.10.2021.
//

import UIKit

class SkillsController: UITableViewController {

    var skills: [Skill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(skills)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        skills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as! SkillCell

        cell.skillTitle.text = skills[indexPath.row].title
        cell.skillDescription.text = skills[indexPath.row].description

        return cell
    }
    
}
