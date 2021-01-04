//
//  MainAppVC.swift
//  Login
//
//  Created by Anna Sibirtseva on 03/01/2021.
//

import UIKit

class MainAppVC: UIViewController {
    
    private let user: User
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) is not implemented")
    }
    
    init?(user: User, coder: NSCoder) {
      self.user = user
      super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Hello, \(user.name)! You are a \(user.occupation)!"
        avatar.image = user.avatar
    }
}




