//
//  MainAppVC.swift
//  Login
//
//  Created by Anna Sibirtseva on 03/01/2021.
//

import UIKit

class MainAppVC: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = self.user else { return }
        greetingLabel.text = "Hello, \(user.name)! You are a \(user.occupation)!"
        avatar.image = user.avatar
    }
}
