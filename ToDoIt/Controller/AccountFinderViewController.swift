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
        self.title = ""
    }
    
    private func settingAddTargets() {
        accountFinderView.emailFinderButton.addTarget(self, action: #selector(idFinderButtonTapped), for: .touchUpInside)
        accountFinderView.pwFinderButton.addTarget(self, action: #selector(pwFinderButtonTapped), for: .touchUpInside)
    }
    
    @objc private func idFinderButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.accountFinderView.emailUnderlineView.backgroundColor = AppColors.shared.buttonBackGroundColor
            self.accountFinderView.pwUnderlineView.backgroundColor = .darkGray
            self.accountFinderView.emailPasswordChoiceView.checkMainText = 0
        }
    }
    
    @objc private func pwFinderButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.accountFinderView.emailUnderlineView.backgroundColor = .darkGray
            self.accountFinderView.pwUnderlineView.backgroundColor = AppColors.shared.buttonBackGroundColor
            self.accountFinderView.emailPasswordChoiceView.checkMainText = 1
        }

    }
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

