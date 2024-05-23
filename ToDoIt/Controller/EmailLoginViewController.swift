//
//  EmailLoginViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit

final class EmailLoginViewController: UIViewController {
    private let emailLoginView = EmailLoginView()
    
    override func loadView() { // 뷰를 교체
        self.view = emailLoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "로그인"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        settingAddTargets()
    }
    
    func settingAddTargets() {
        emailLoginView.accountFinderButton.addTarget(self, action: #selector(accountFinderButtonTapped), for: .touchUpInside)
        emailLoginView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        emailLoginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func accountFinderButtonTapped() {
        //navigationController?.pushViewController(AccountFinderViewController(), animated: true)
    }
    
    @objc func signInButtonTapped() {
        //present(SignInViewController(), animated: true)
        
    }
    
    @objc func loginButtonTapped() {
        //(UIApplication.shared.connectedScenes.first?.delegate as? //SceneDelegate)?.changeRootViewController()
    }
}
