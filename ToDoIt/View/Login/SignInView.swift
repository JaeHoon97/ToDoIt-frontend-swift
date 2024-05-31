//
//  SignInView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//
// MARK: - 사용자가 이메일로 계정을 생성하기 위한 화면

import UIKit
import SnapKit

final class SignInView: UIView {
    
    private let mainTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "회원가입"
        lb.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 17)
        lb.textColor = .black
        lb.textAlignment = .center
        lb.clipsToBounds = true
        return lb
    }()
    
    private let emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "이메일"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    private let emailTextField: UITextField = { // 이메일 입력 창
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .next // 엔터키는 다음으로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    private let nicknameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "닉네임"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    private let nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .next // 엔터키는 다음으로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    private let tellLabel: UILabel = {
        let lb = UILabel()
        lb.text = "전화번호"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    private let tellTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "전화번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .next // 엔터키는 다음으로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    private let passwordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .next // 엔터키는 다음으로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    private let passwordCheckTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호를 재입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .next // 엔터키는 다음으로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    
    private let createButton: UIButton = { // 로그인 버튼
        let bt = UIButton(type: .custom)
        bt.setTitle("계정 생성하기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 15)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.titleLabel?.textColor = .white
        bt.clipsToBounds = false
        bt.layer.cornerRadius = 10
        return bt
    }()
    
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
    
    // MARK: - 메서드 정의
    
    private func setupUI() {
        [mainTitleLabel, emailLabel, emailTextField, nicknameLabel, nicknameTextField, passwordLabel, passwordTextField, passwordCheckTextField, createButton, tellLabel, tellTextField]
            .forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(80)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        tellLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        tellTextField.snp.makeConstraints { make in
            make.top.equalTo(tellLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        createButton.snp.makeConstraints { make in
            make.top.equalTo(tellTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
    }
    
}
