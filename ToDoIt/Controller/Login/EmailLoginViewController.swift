//
//  EmailLoginViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//
// MARK: - 사용자가 가입한 이메일 계정으로 로그인을 시도하기 위한 뷰

import UIKit

final class EmailLoginViewController: UIViewController {
    private let emailLoginView = EmailLoginView()
    
    // MARK: - 뷰를 교체
    override func loadView() {
        self.view = emailLoginView
    }
    
    // MARK: - 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        settingAddTargets()
    }
    
    // MARK: - 네비게이션 세팅
    private func setupNavigation() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    // MARK: - 애드 타켓 세팅
    private func settingAddTargets() {
        emailLoginView.accountFinderButton.addTarget(self, action: #selector(accountFinderButtonTapped), for: .touchUpInside)
        emailLoginView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        emailLoginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - 사용자가 "계정을 잃어버렸나요?" 버튼을 클릭했을 때
    @objc private func accountFinderButtonTapped() {
        let accountFinderViewController = AccountFinderViewController()
        navigationController?.pushViewController(accountFinderViewController, animated: true)
    }
    // MARK: - 사용자가 "회원가입" 버튼을 클릭했을 때
    @objc private func signInButtonTapped() {
        let signInViewController = SignInViewController()
        present(signInViewController, animated: true)
        
    }
    // MARK: - 사용자가 "로그인" 버튼을 클릭했을 때
    @objc private func loginButtonTapped() {
        Haptics.Shared.generateLightHaptics() // 사용자에게 햅틱 생성
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController() // 루트 뷰를 교체하기
    }
    
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
