//
//  ViewController.swift
//  Login
//
//  Created by Anna Sibirtseva on 02/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel = ViewModel()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    let correctUsername = "Anna"
    let correctPassword = "12345"
    
    override func viewDidLoad() {
        usernameTextField.placeholder = viewModel.username
        passwordTextField.placeholder = viewModel.password
        button.setTitle(viewModel.loginButton, for: .normal)
    }
    

    @IBAction func didTapLogin() {
        guard
            usernameTextField.text == correctUsername,
            passwordTextField.text == correctPassword
        else { incorrectLoginAlert(); return }
        
        let deadline = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            let user = User(name: "Anna", occupation: "developer", avatar: #imageLiteral(resourceName: "myImage"))
            self.performSegue(withIdentifier: "seque.Main.loginToApp", sender: user)
        }
    }
    
    func incorrectLoginAlert() {
        let alert = UIAlertController(title: "Login Failed",
                                      message: "Incorrect username or password, please try again",
                                      preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let mainAppVC = segue.destination as? MainAppVC, let user = sender as? User {
            mainAppVC.user = user
        }
    }
}

