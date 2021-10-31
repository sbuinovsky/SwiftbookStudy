//
//  ViewController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 25.10.2021.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        loginTextField.tag = 0
        passwordTextField.tag = 1
        
        loginTextField.enablesReturnKeyAutomatically = true
        passwordTextField.enablesReturnKeyAutomatically = true
        
        user = User()
        user?.configureUser()
        
        //MARK: - Fill form
        loginTextField.text = user?.login
        passwordTextField.text = user?.password
    }
    
    
    @IBAction func loginReminderPressed(_ sender: Any) {
        
        showReminderAlert(title: "Login reminder",
                          message: "Your login is \(user?.login ?? "")")
    }
    
    
    @IBAction func passwordReminderPressed(_ sender: Any) {
        
        showReminderAlert(title: "Password reminder",
                          message: "Your password is \(user?.password ?? "")")
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let userLogin = loginTextField.text else {return}
        guard let userPassword = passwordTextField.text else {return}
        
        if userLogin == user?.login && userPassword == user?.password {
            performSegue(withIdentifier: "tabBarControllerSegue", sender: UIButton.self)
        } else {
            
            showAccessAlert(title: "Access denied!", message: "Your login or password is incorrect!")
            passwordTextField.text = nil
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        
        guard let tabBarControllers = tabBarController.viewControllers else {return}
        
        for controller in tabBarControllers {
            
            switch controller {
            case is AboutController:
                let destController = controller as! AboutController
                destController.user = user
            case is SkillsController:
                let destController = controller as! SkillsController
                destController.skills = user?.skills
            case is UINavigationController:
                let navigationController = controller as! UINavigationController
                guard let destController = navigationController.topViewController as? ProjectsController else {return}
                destController.projects = user?.projects
            default:
                break
            }
            
        }
    }
    
}


// MARK: - Extension
extension LoginController {
    
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagBasedTextField(textField)
        if textField.tag == 1 {
            loginButtonPressed(self)
        }
        return true
    }
    
    
    private func showReminderAlert(title: String,
                                   message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showAccessAlert(title: String,
                                   message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
