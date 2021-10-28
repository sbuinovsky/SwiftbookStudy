//
//  ViewController.swift
//  LoginScreen
//
//  Created by Станислав Буйновский on 25.10.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private let defaultLogin = "root"
    private let defaultPassword = "toor"

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.loginTextField.tag = 0
        self.passwordTextField.tag = 1
        
        self.loginTextField.enablesReturnKeyAutomatically = true
        self.passwordTextField.enablesReturnKeyAutomatically = true
        
    }

    
    @IBAction func loginDidStartEditing(_ sender: Any) {
        loginTextField.placeholder = ""
    }
    
    
    @IBAction func loginDidEndEditing(_ sender: Any) {
        if loginTextField.state.isEmpty {
            loginTextField.placeholder = "Login..."
        }
    }
    
    
    @IBAction func passwordDidStartEditing(_ sender: Any) {
        passwordTextField.placeholder = ""
    }
    
    
    @IBAction func passwordDidEndEditing(_ sender: Any) {
        if passwordTextField.state.isEmpty {
            passwordTextField.placeholder = "Password..."
        }
    }
    
    
    @IBAction func loginReminderPressed(_ sender: Any) {
        
        showReminderAlert(title: "Login reminder",
                          message: "Your login is \(defaultLogin)")
        
    }
    
    
    @IBAction func passwordReminderPressed(_ sender: Any) {
        
        showReminderAlert(title: "Password reminder",
                          message: "Your password is \(defaultPassword)")
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let userLogin = loginTextField.text else {return}
        guard let userPassword = passwordTextField.text else {return}
        
        if userLogin == defaultLogin && userPassword == defaultPassword {
            performSegue(withIdentifier: "toWelcomeScreen", sender: UIButton.self)
        } else {
            
            showAccessAlert(title: "Access denied!", message: "Your login or password is incorrect!")
            passwordTextField.text = nil
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else {
            return}
        
        welcomeViewController.login = loginTextField.text
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {
            return}
        
        loginTextField.text = nil
        passwordTextField.text = nil
    }
    
}


// MARK: - Extension
extension ViewController {
    
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
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

