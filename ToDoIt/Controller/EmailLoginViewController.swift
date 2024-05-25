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
        setupNavigation()
        settingAddTargets()
    }
    
    private func setupNavigation() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func settingAddTargets() {
        emailLoginView.accountFinderButton.addTarget(self, action: #selector(accountFinderButtonTapped), for: .touchUpInside)
        emailLoginView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        emailLoginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func accountFinderButtonTapped() {
        let accountFinderViewController = AccountFinderViewController()
        navigationController?.pushViewController(accountFinderViewController, animated: true)
    }
    
    @objc private func signInButtonTapped() {
        let signInViewController = SignInViewController()
        present(signInViewController, animated: true)
        
    }
    
    @objc private func loginButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController()
    }
    
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
