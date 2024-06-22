//
//  AuthSelectionView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//
// MARK: - 사용자가 카카오 로그인과 이메일 로그인 중 선택하는 화면

import UIKit
import SnapKit

final class AuthSelectionView: UIView {
    let appLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "GachonLogo")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let kakaoTalkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "kakao_login_large_wide")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true // 사용자와 상호작용 여부
        return iv
    }()
    
    let emailLoginButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("이메일로 로그인하기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.Jalnan2, size: 15)
        bt.setTitleColor(.black, for: .normal)
        bt.backgroundColor = .clear
        bt.layer.cornerRadius = 10
        bt.layer.masksToBounds = true
        bt.setUnderline()
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
    
    override func updateConstraints() {
        super.updateConstraints() // 무조건 마지막에 오도록 작성
    }
    
    private func setupUI() {
        [appLogoImageView, kakaoTalkImageView, emailLoginButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setupLayout() {
        
        guard let kakaoImageSize = kakaoTalkImageView.image?.size else { return }
        
        appLogoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
        
        kakaoTalkImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.centerY).offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(kakaoImageSize.height)
            make.width.equalTo(kakaoImageSize.width)
        }
        
        emailLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoTalkImageView.snp.bottom).offset(40)
            make.leading.equalTo(self.snp.leading).offset(100)
            make.trailing.equalTo(self.snp.trailing).inset(100)
            make.height.equalTo(30)
        }
    }
}
