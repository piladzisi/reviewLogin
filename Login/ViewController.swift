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
    
    var users: [String] = []
    var username: String = ""
    let correctPassword = "12345"
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        usernameTextField.placeholder = viewModel.username
        passwordTextField.placeholder = viewModel.password
        button.setTitle(viewModel.loginButton, for: .normal)
        getUsers()
    }
    
    
    @IBAction func didTapLogin() {
        guard let username = usernameTextField.text else { return }
        self.username = username
        guard
            users.contains(username),
            passwordTextField.text == correctPassword
        else { incorrectLoginAlert(); return }
        
    }
    
    @IBSegueAction func makeMainAppVC(coder: NSCoder) -> MainAppVC? {
        let user = User(name: username, occupation: "developer", avatar: #imageLiteral(resourceName: "myImage"))
        return MainAppVC(user: user, coder: coder)
    }
    
    func getUsers() {
        let baseUrl = "https://jsonplaceholder.typicode.com/"
        guard let usersUrl = URL(string: (baseUrl + "users")) else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: usersUrl) { (data, response, error) in
            if let response = response  as? HTTPURLResponse{
                print(response.statusCode)
            }
            
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]] else { return }
                    for user in json {
                        guard let name = user["name"] as? String else { return }
                        var firstName: String
                        
                        if let i = name.firstIndex(of: " ") {
                            firstName = String(name[..<i])
                            self.users.append(firstName)
                            print(self.users)
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
        
        dataTask.resume()
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
