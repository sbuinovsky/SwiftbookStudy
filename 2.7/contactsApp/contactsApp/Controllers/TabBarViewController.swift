//
//  TabBarViewController.swift
//  contactsApp
//
//  Created by Станислав Буйновский on 10.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persons = Person.getPersons()
        pushDataToTabs(for: persons)
    }
    
    private func pushDataToTabs(for data: [Person]) {
        guard let tabBarControllers = self.viewControllers else { return }
        
        for controller in tabBarControllers {
            if let contactsListVC = controller as? ContactsListViewController {
                contactsListVC.persons = data
            } else if let contactsSectionsVC = controller as? ContactsSectionsViewController {
                contactsSectionsVC.persons = data
            }
        }
    }
}
