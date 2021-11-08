//
//  ViewController.swift
//  BackgroundSwitcher
//
//  Created by Станислав Буйновский on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateBackground(_ newColor: UIColor?)
}

class MainController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.currentColor = view.backgroundColor
            settingsVC.delegate = self
        }
    }
}

extension MainController: SettingsViewControllerDelegate {
    
    func updateBackground(_ newColor: UIColor?) {
        view.backgroundColor = newColor
    }
    
    
}

