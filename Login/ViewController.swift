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
    
    override func viewDidLoad() {
        usernameTextField.placeholder = viewModel.username
        passwordTextField.placeholder = viewModel.password
        button.setTitle(viewModel.loginButton, for: .normal)
    }
    
    @IBAction func didTapLogin() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            print("login")
            self.performSegue(withIdentifier: "seque.Main.loginToApp", sender: nil)
        }
    }
}

