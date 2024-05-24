//
//  AccountFinderViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/24/24.
//

import UIKit

final class AccountFinderViewController: UIViewController {
    
    private let accountFinderView = AccountFinderView()

    override func loadView() {
        self.view = accountFinderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        settingAddTargets()
    }
    
    private func setupNavigation() {
        self.title = "이메일 / 비밀번호 찾기"
    }
    
    private func settingAddTargets() {
        accountFinderView.emailFinderButton.addTarget(self, action: #selector(idFinderButtonTapped), for: .touchUpInside)
        accountFinderView.pwFinderButton.addTarget(self, action: #selector(pwFinderButtonTapped), for: .touchUpInside)
    }
    
    @objc private func idFinderButtonTapped() {
        accountFinderView.emailFinderButton.setTitleColor(AppColors.shared.buttonTextColor, for: .normal)
        accountFinderView.emailUnderlineView.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8117647059, blue: 0.3647058824, alpha: 1)
        accountFinderView.pwFinderButton.setTitleColor(.darkGray, for: .normal)
        accountFinderView.pwUnderlineView.backgroundColor = .darkGray
        accountFinderView.emailPasswordChoiceView.checkMainText = 0
    }
    
    @objc private func pwFinderButtonTapped() {
        accountFinderView.emailFinderButton.setTitleColor(.darkGray, for: .normal)
        accountFinderView.emailUnderlineView.backgroundColor = .darkGray
        accountFinderView.pwFinderButton.setTitleColor(AppColors.shared.buttonTextColor, for: .normal)
        accountFinderView.pwUnderlineView.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8117647059, blue: 0.3647058824, alpha: 1)
        accountFinderView.emailPasswordChoiceView.checkMainText = 1
    }
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

