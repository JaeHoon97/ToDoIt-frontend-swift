//
//  EventSummaryView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/26/24.
//

import UIKit
import SnapKit

// MARK: - 그림자를 세팅하기 위한 뷰
// MARK: - 사용자가 일정을 생성하고 생성된 일정 목록을 보여주는 contentView를 담고 있는 뷰

final class EventSummaryView: UIView {
    
    // MARK: - EventSummaryView에서는 그림자를 설정하고, contentView는 실제 컨텐츠를 담고 있는 뷰
    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - 이벤트 날짜를 표시하는 레이블
    let eventDate: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 15)
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        return lb
    }()
    
    // MARK: - 사용자의 개인일정을 생성하는 버튼
    let createEventButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("+ 일정을 생성하세요", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 13)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    // MARK: - 이벤트 날짜에 해당하는 일정들을 표시하는 테이블 뷰
    let eventTableView: UITableView = {
        let tv = UITableView()
        tv.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.ID)
        tv.backgroundColor = .clear
        tv.separatorStyle = .none // 셀 간의 구분선 제거
        tv.showsVerticalScrollIndicator = false // 수직으로 스크롤할 때 인디케이터 제거
        tv.clipsToBounds = true
        return tv
    }()
    
    // MARK: - 데이터 소스
    var dataSource: UITableViewDiffableDataSource<Section, Schedule>!
    
    // MARK: - 스냅샷
    var snapshot: NSDiffableDataSourceSnapshot<Section, Schedule>!
    
    var personalSchedules: [Schedule] = [
        Schedule(mainTitle: "경기도 성남시 분당구"),
        Schedule(mainTitle: "경기도 성남시 수정구"),
        Schedule(mainTitle: "경기도 성남시 중원구"),
        Schedule(mainTitle: "경기도 성남시 중원구"),
        Schedule(mainTitle: "경기도 성남시 분당구"),
        Schedule(mainTitle: "경기도 성남시 중원구"),
        Schedule(mainTitle: "경기도 성남시 분당구"),
        Schedule(mainTitle: "경기도 성남시 중원구"),
        Schedule(mainTitle: "경기도 성남시 분당구"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupDataSourceAndSnapShot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        [contentView].forEach {
            self.addSubview($0)
        }
        
        [eventDate, eventTableView, createEventButton].forEach {
            contentView.addSubview($0)
        }
        
        // MARK: - EventSummaryView가 그림자 영역UI를 담당
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1 // 그림자 투명도
        self.layer.shadowRadius = 10 // 그림자 블러
        self.layer.shadowOffset = CGSize(width: 1, height: 4)
        self.layer.cornerRadius = 25
    }
    
    private func setupDataSourceAndSnapShot() {
        dataSource = UITableViewDiffableDataSource<Section, Schedule>(tableView: self.eventTableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.ID, for: indexPath) as! ScheduleTableViewCell
            cell.mainText.text = itemIdentifier.mainTitle
            cell.selectionStyle = .none // 셀을 클릭했을 때 나오는 색 제거
            return cell
        })
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Schedule>()
        snapshot.appendSections([.schedule])
        snapshot.appendItems(personalSchedules, toSection: .schedule)
        dataSource.apply(snapshot)
        
    }
    // MARK: - 계층 구조 EventSummaryView -> contentView -> eventDate, eventTableView, createEventButton
    private func setupLayout() {
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        eventDate.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        eventTableView.snp.makeConstraints { make in
            make.top.equalTo(eventDate.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(createEventButton.snp.top).offset(-15)
        }
        
        createEventButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.08)
        }
    }
    
    
}
