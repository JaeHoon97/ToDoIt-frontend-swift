//
//  HomeView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//
// MARK: - 메인 화면 기능으로 사용자가 오늘 할 일을 생성, 수정, 삭제
// MARK: - 대쉬보드를 통해 사용자에게 날짜, 진행여부를 표시

import UIKit
import SnapKit

final class HomeView: UIView {
    
    // MARK: - 대쉬보드 뷰
    private let dashBoardView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.shared.dashboardBackGroundColor
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - 대쉬보드 뷰 안에 있는 스택 뷰
    private lazy var dashBoardStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [dateLabel, dataStackView, progressView])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    // MARK: - 오늘 날짜를 표시
    private let dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "05월 31일 수"
        lb.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 23)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    
    // MARK: - ToDo의 진행률을 막대그래프로 표시
    private let progressView: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.trackTintColor = AppColors.shared.mainBackGroundColor
        pv.progressTintColor = AppColors.shared.buttonBackGroundColor
        pv.progress = 0.4
        return pv
    }()
    
    // MARK: - 총 일정 수, 완료 일정 수, 진행률을 담기 위한 수평 스택 뷰
    private lazy var dataStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [totalLabel, totalScoreLabel, doneLabel, doneScoreLabel, percentLabel])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    // MARK: - "전체" 표시
    private let totalLabel: UILabel = {
        let lb = UILabel()
        lb.text = "전체"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 오늘 날짜에 해당하는 총 일정 수
    private let totalScoreLabel: UILabel = {
        let lb = UILabel()
        lb.text = "10"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 15)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - "완료" 표시
    private let doneLabel: UILabel = {
        let lb = UILabel()
        lb.text = "완료"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 오늘 날짜에 해당하는 완료된 일정 수
    private let doneScoreLabel: UILabel = {
        let lb = UILabel()
        lb.text = "4"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 15)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 완료된 일정 수 / 전체 일정 수 값을 퍼센트로 표시
    private let percentLabel: UILabel = {
        let lb = UILabel()
        lb.text = "44%"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 15)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.textAlignment = .right
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 오늘 날짜를 변환해주고 변환된 날짜를 dateLabel에 세팅
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MM월 dd일 (E)"
        df.locale = Locale(identifier: "ko_KR")
        return df
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupUI() {
        self.backgroundColor = AppColors.shared.mainBackGroundColor
        dateLabel.text = dateFormatter.string(from: Date())
        
        [dashBoardView].forEach {
            addSubview($0)
        }
        
        [dashBoardStackView].forEach {
            dashBoardView.addSubview($0)
        }
        
    }
    
    private func setupLayout() {
        dashBoardView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        dashBoardStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dashBoardView.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
        }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        
    }
    

}
