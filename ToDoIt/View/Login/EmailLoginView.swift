//
//  EmailLoginView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//
// MARK: - 사용자가 가입한 이메일 계정으로 로그인을 시도하는 화면

import UIKit
import SnapKit

final class EmailLoginView: UIView {
    // MARK: - 프로퍼티 정의
    
    private let loginStackView: UIStackView = { // 이메일 입력 창과 비밀번호 입력 창을 담고있는 스택뷰
        let sv = UIStackView()
        sv.axis = .vertical // 스택의 기준은 세로
        sv.distribution = .fillEqually // 세로 사이즈를 동일하게 분배
        sv.alignment = .fill // 가로로 꽉 채워서
        sv.spacing = 15
        return sv
    }()
    
    lazy var emailTextField: UITextField = { // 이메일 입력 창
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
    
    lazy var passwordTextField: UITextField = { // 비밀번호 입력 창
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.NanumGothicBold, size: 12)
        tf.textColor = .black
        tf.backgroundColor = AppColors.shared.TextFieldBackGroundColor
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.layer.borderWidth = AppTexts.shared.TextFieldBorderWidth
        tf.clipsToBounds = true
        tf.keyboardType = .default
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .done // 엔터키는 완료로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    private let warningMessageLabel: UILabel = { // 사용자의 입력에 오타가 발생했을 때 경고메시지를 전달하는 레이블
        let lb = UILabel()
        lb.text = "바르게 입력해주세요!"
        lb.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 13)
        lb.textColor = .clear
        lb.clipsToBounds = true
        return lb
    }()
    
    let loginButton: UIButton = { // 로그인 버튼
        let bt = UIButton(type: .custom)
        bt.setTitle("로그인", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 15)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.titleLabel?.textAlignment = .center
        bt.titleLabel?.textColor = .white
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    private let accountFindStackView: UIStackView = { // 계정 찾기 스택뷰
        let sv = UIStackView()
        sv.axis = .horizontal // 스택의 기준은 가로
        sv.distribution = .fillEqually // 가로 사이즈를 동일하게 분배
        sv.alignment = .fill // 세로로 꽉 채워서
        sv.backgroundColor = .clear
        return sv
    }()
    
    let accountFinderButton: UIButton = { // 계정 찾기 버튼
        let bt = UIButton(type: .custom)
        bt.setTitle("계정을 잃어버렸나요?", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 13)
        bt.backgroundColor = .clear
        bt.titleLabel?.textColor = .black
        bt.clipsToBounds = true
        bt.contentHorizontalAlignment = .left
        bt.setUnderline() // 텍스트의 하단에 밑줄을 표시
        return bt
    }()
    
    let signInButton: UIButton = { // 계정만들기 버튼
        let bt = UIButton(type: .custom)
        bt.setTitle("회원가입", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 13)
        bt.backgroundColor = .clear
        bt.titleLabel?.textColor = .black
        bt.clipsToBounds = true
        bt.contentHorizontalAlignment = .right
        bt.setUnderline() // 텍스트의 하단에 밑줄을 표시
        return bt
    }()
    
    // MARK: - 로그인 뷰 초기화
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
        [loginStackView, warningMessageLabel, loginButton, accountFindStackView].forEach {
            addSubview($0) }
        
        [emailTextField, passwordTextField] // 이메일 입력 창과 비밀번호 입력 창을 추가
            .forEach { loginStackView.addArrangedSubview($0) }
        
        [accountFinderButton, signInButton] // 이메일 찾기 버튼과 비밀번호 찾기 버튼을 추가
            .forEach { accountFindStackView.addArrangedSubview($0) }
    }
    
    private func setupLayout() { // 하위 뷰들의 크기를 설정하는 메서드
        
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
        }
        
        warningMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(loginStackView.snp.bottom).offset(10)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(warningMessageLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
        
        accountFindStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.leading.equalTo(self.snp.leading).offset(60)
            make.trailing.equalTo(self.snp.trailing).inset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(42.5)
        }
    }
}
