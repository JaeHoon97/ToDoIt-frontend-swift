//
//  AuthSelectionViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class AuthSelectionViewController: UIViewController {
    
    private let authSelectionView = AuthSelectionView()
    
    override func loadView() {
        self.view = authSelectionView
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
        authSelectionView.emailLoginButton.addTarget(self, action: #selector(emailLoginButtonTapped), for: .touchUpInside)
        authSelectionView.kakaoTalkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(kakaoLoginButtonTapped)))
        
    }
    
    private func setUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                guard let kakaoNickname = user?.kakaoAccount?.profile?.nickname else { return }
                guard let kakaoEmail = user?.kakaoAccount?.email else { return }
                guard let kakaoID = user?.id else { return }
                print("카카오 닉네임: \(kakaoNickname)")
                print("카카오 이메일: \(kakaoEmail)")
                print("카카오 아이디: \(kakaoID)")
            }
        }
    }
    
    @objc private func emailLoginButtonTapped() {
        let emailLoginViewController = EmailLoginViewController()
        navigationController?.pushViewController(emailLoginViewController, animated: true)
    }
    
    @objc private func signinButtonTapped() {
        //present(SignInViewController(), animated: true);
    }
    
    @objc private func kakaoLoginButtonTapped() {
        print("카카오 로그인 버튼 클릭!")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡 앱으로 로그인 성공")
                    
                    _ = oauthToken
                    self.setUserInfo()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    self.setUserInfo()
                }
            }
        }
    }
    

}
