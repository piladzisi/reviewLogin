//
//  MainAppVC.swift
//  Login
//
//  Created by Anna Sibirtseva on 03/01/2021.
//

import UIKit

class MainAppVC: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let username = self.username, username != "" {
            greetingLabel.text = "Hello, \(username)!"
        } else {
            greetingLabel.text = "Hello, stranger!"
        }
    }
}
