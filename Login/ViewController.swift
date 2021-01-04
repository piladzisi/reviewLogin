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
            //self.makeMainAppVC(coder: self.coder)
        }
    }
    
    @IBSegueAction func makeMainAppVC(coder: NSCoder) -> MainAppVC? {
        let user = User(name: "Anna", occupation: "developer", avatar: #imageLiteral(resourceName: "myImage"))
        return MainAppVC(user: user, coder: coder)
    }
    
    func makeVC(coder: NSCoder) {
        
    }
    
    func incorrectLoginAlert() {
        let alert = UIAlertController(title: "Login Failed",
                                      message: "Incorrect username or password, please try again",
                                      preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}


//
//Comparing IBSegueAction vs prepare(for:sender:)
//Here are the advantages of using IBSegueAction:
//
//Cleaner code: Each segue can have its own IBSegueAction, resulting in code that is easier to design and maintain.
//No switching on string constants: prepare(for:sender:) requires you to switch on segue.identifier values that can get out of sync with the identifier properties in the storyboard file.
//Better encapsulation: The properties can now be private since the value can be set by the initializer and not after initialization inprepare(for:sender:).
//Immutability: The required properties can be let constants when appropriate since the value is set by the initializer.
//Less casting: There’s no need to cast the sender.destination to an EditNoteViewController to configure its properties. You create an instance of the view controller type you need.
//Easier to test: Since you are not relying on UIKit to create your view controller instances, it will be much easier to create tests for your view controllers.
//There is one disadvantage to using IBSegueAction: It is only available for iOS 13 or later. So, if your app must run on earlier versions of iOS, you’ll have to wait to start using this new approach.
//
