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
        
        guard let username = self.username  else { return }
        greetingLabel.text = "Hello, \(username)!"
    }
}
