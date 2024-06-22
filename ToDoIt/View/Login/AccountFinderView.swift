//
//  AccountFinderView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/24/24.
//
// MARK: - 사용자가 가입한 계정을 찾기 위한 화면

import UIKit
import SnapKit

final class AccountFinderView: UIView {
    
    let emailFinderButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("이메일 찾기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.Jalnan2, size: 15)
        bt.backgroundColor = .clear
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.textAlignment = .center
        bt.clipsToBounds = false
        return bt
    }()
    
    let emailUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.shared.buttonBackGroundColor
        view.clipsToBounds = false
        return view
    }()
    
    private let emailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()
    
    let pwFinderButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("비밀번호 찾기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.Jalnan2, size: 15)
        bt.backgroundColor = .clear
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.textAlignment = .center
        bt.clipsToBounds = false
        return bt
    }()
    
    let pwUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.clipsToBounds = false
        return view
    }()
    
    private let pwStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()
    
    private let emailAndPwStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .fillEqually
        sv.alignment = .fill
        return sv
    }()
    
    let emailPasswordChoiceView = EmailPasswordChoiceView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.shared.mainBackGroundColor
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [emailAndPwStackView, emailPasswordChoiceView].forEach { addSubview($0) }
        
        [emailFinderButton, emailUnderlineView].forEach { emailStackView.addArrangedSubview($0) }
        [pwFinderButton, pwUnderlineView].forEach { pwStackView.addArrangedSubview($0) }
        [emailStackView, pwStackView].forEach { emailAndPwStackView.addArrangedSubview($0) }
        
    }
    
    private func setupLayout() {
        emailAndPwStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.trailing.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        pwUnderlineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        emailUnderlineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        emailPasswordChoiceView.snp.makeConstraints { make in
            make.top.equalTo(emailUnderlineView.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.bottom.equalTo(self.snp.bottom).inset(30)
        }
        
    }
    
    
}

