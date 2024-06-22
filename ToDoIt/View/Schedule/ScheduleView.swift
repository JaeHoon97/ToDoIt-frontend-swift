//
//  ScheduleView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//

import UIKit
import SnapKit
import FSCalendar

final class ScheduleView: UIView {
    
    // MARK: - fsCalendar 달력
    let fsCalendarView: FSCalendar = {
        let fsCal = FSCalendar()
        // MARK: - 기본 설정
        fsCal.backgroundColor = .clear
        fsCal.layer.cornerRadius = 20
        fsCal.locale = Locale(identifier: "ko_KR") // 표시 언어를 한국어로
        fsCal.scope = .month // 월간 달력
        fsCal.scrollEnabled = true // 스크롤 허용
        fsCal.scrollDirection = .horizontal // 달력의 스크롤 방향을 수평으로
        // MARK: - 헤더 영역
        fsCal.headerHeight = 0 // 헤더 높이를 0으로 설정하여 헤더를 제거
        // MARK: - 요일 영역
        fsCal.appearance.weekdayFont = UIFont(name: FontManager.Jalnan2, size: 12) // 요일 일~월의 폰트 설정
        fsCal.appearance.weekdayTextColor = .black
        // MARK: - 숫자 영역(title)
        fsCal.appearance.titleFont = UIFont(name: FontManager.Jalnan2, size: 11) // 숫자 1~31일 폰트 설정
        fsCal.appearance.titleWeekendColor = AppColors.shared.fsCalendarTitleWeekendColor // 폰트 색상
        // MARK: - 투데이 영역
        fsCal.appearance.todayColor = .darkGray // 오늘
        fsCal.appearance.todaySelectionColor = .systemGray
        // MARK: - 메모 영역(subtitle)
        fsCal.appearance.subtitleFont = UIFont(name: FontManager.Jalnan2, size: 10)
        return fsCal
    }()
    
    // MARK: - 달력과 이벤트를 구분하기 위한 뷰
    private let divisionView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.clipsToBounds = true
        return v
    }()
    
    // MARK: - 일/요일 표시 레이블
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: FontManager.Jalnan2, size: 16)
        lb.textColor = .black
        lb.clipsToBounds = true
        lb.numberOfLines = 1
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    // MARK: - 음력 월/일 표시 레이블
    let lunarDateLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: FontManager.Jalnan2, size: 12)
        lb.textColor = .systemGray
        lb.clipsToBounds = true
        lb.numberOfLines = 1
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 네비게이션 왼쪽 바 버튼 날짜 표시 Label
    let naviDateLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FontManager.Jalnan2, size: 18)
        lb.textAlignment = .left
        lb.textColor = .black
        lb.numberOfLines = 1
        lb.backgroundColor = .clear
        lb.adjustsFontSizeToFitWidth = true
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setLunarDateLabel()
        setDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 현재 날짜를 일/요일로 변환하고 dateLabel에 텍스트 설정
    private func setDateLabel(){
        dateLabel.text = DateManager.shared.getDayAndWeekDate(Date())
    }
    
    // MARK: - 음력 날짜를 구하고 lunarDateLabel에 텍스트 설정
    private func setLunarDateLabel() {
        lunarDateLabel.text = DateManager.shared.getLunarDate(Date())
    }
    
    private func setupUI() {
        self.backgroundColor = AppColors.shared.mainBackGroundColor
        
        [fsCalendarView, divisionView, dateLabel, lunarDateLabel].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func setupLayout() {
        fsCalendarView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(self.snp.centerY).offset(30)
        }
        
        divisionView.snp.makeConstraints { make in
            make.top.equalTo(fsCalendarView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(divisionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        lunarDateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.top)
            make.leading.equalTo(dateLabel.snp.trailing).offset(10)
            make.centerY.equalTo(dateLabel.snp.centerY)
        }
        
        naviDateLabel.snp.makeConstraints { make in
            make.width.equalTo(130)
        }
    }
}
