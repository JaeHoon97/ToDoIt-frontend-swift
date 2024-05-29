//
//  UserInfoViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private let userInfoView = UserInfoView()
    
    override func loadView() {
        self.view = userInfoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
