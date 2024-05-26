//
//  EventSummaryView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/26/24.
//

import UIKit
import SnapKit

final class EventSummaryView: UIView {
    
    // EventSummaryView에서는 그림자를 설정하고, contentView는 실제 컨텐츠를 담고 있는 뷰
    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    let eventDate: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 17)
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.textAlignment = .left
        return lb
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
        [contentView].forEach {
            self.addSubview($0)
        }
        
        [eventDate].forEach {
            contentView.addSubview($0)
        }
        
        // MARK: - EventSummaryView가 그림자를 세팅
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1 // 그림자 투명도
        self.layer.shadowRadius = 10 // 그림자 블러
        self.layer.shadowOffset = CGSize(width: 1, height: 4)
        self.layer.cornerRadius = 25
    }
    
    private func setupLayout() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        eventDate.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    
}
