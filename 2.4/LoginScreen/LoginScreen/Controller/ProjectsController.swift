//
//  ProjectsController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 28.10.2021.
//

import UIKit

class ProjectsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var projects: [Project]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        projects?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectCell
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        cell.projectLabel.text = projects?[indexPath.row].title ?? ""
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is ProjectCell {
            guard let destination = segue.destination as? ProjectController else {return}
            guard let cell = sender as? ProjectCell else {return}
            destination.projectTitle = cell.projectLabel.text ?? ""
        }
    }
}
