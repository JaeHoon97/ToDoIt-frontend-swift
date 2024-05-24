//
//  SignInViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit

import UIKit

final class SignInViewController: UIViewController {
    
    private let signInView = SignInView()
    
    override func loadView() {
        self.view = signInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
