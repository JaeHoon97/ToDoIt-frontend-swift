//
//  EmailPasswordChoiceVIew.swift
//  ToDoIt
//
//  Created by 재훈 on 5/24/24.
//
// MARK: - 사용자가 계정을 찾을 때 이메일 또는 비밀번호 중 하나를 선택하고 계정을 찾는 화면

import UIKit
import SnapKit

final class EmailPasswordChoiceView: UIView {
    
    var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "닉네임"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    var mainTextField: UITextField = {
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
    
    var checkButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("이메일 찾기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 15)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.titleLabel?.textAlignment = .center
        bt.titleLabel?.textColor = .white
        bt.clipsToBounds = false
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    var checkMainText: Int = 0 {
        didSet {
            if(checkMainText == 0){
                mainLabel.text = "닉네임"
                checkButton.setTitle("이메일 찾기", for: .normal)
                mainTextField.attributedPlaceholder = NSAttributedString(string: "닉네임을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
            } else {
                mainLabel.text = "이메일"
                checkButton.setTitle("비밀번호 찾기", for: .normal)
                mainTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
            }
        }
    }
    
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
        [mainLabel, mainTextField, tellLabel, tellTextField, checkButton].forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(25)
        }
        
        mainTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(42.5)
        }
        
        tellLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextField.snp.bottom).offset(30)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(25)
        }
        
        tellTextField.snp.makeConstraints { make in
            make.top.equalTo(tellLabel.snp.bottom).offset(20)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(42.5)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(tellTextField.snp.bottom).offset(50)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.height.equalTo(42.5)
        }
    }
}
