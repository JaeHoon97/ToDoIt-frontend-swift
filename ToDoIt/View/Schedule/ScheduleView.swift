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
    
    let fsCalendarView: FSCalendar = {
        let cv = FSCalendar()
        // MARK: - 기본 설정
        cv.backgroundColor = .clear
        cv.layer.cornerRadius = 20
        cv.locale = Locale(identifier: "ko_KR") // 표시 언어를 한국어로
        cv.scope = .month
        cv.scrollEnabled = true
        cv.scrollDirection = .horizontal
        // MARK: - 헤더 영역
        cv.appearance.headerMinimumDissolvedAlpha = 0.0 // 헤더부분(최상단) 좌우측 날짜 제거
        cv.appearance.headerDateFormat = "YYYY년 MM월"
        cv.appearance.headerTitleColor = .black
        cv.appearance.headerTitleOffset = .init(x: 10, y: 10)
        cv.appearance.headerTitleAlignment = .center
        cv.appearance.headerTitleFont = UIFont(name: FontManager.NanumGothicBold, size: 16) // 년도 YYYY년 MM의 폰트 설정
        // MARK: - 요일 영역
        cv.appearance.weekdayFont = UIFont(name: FontManager.NanumGothicBold, size: 12) // 요일 일~월의 폰트 설정
        cv.appearance.weekdayTextColor = AppColors.shared.fsCalendarweekdayTextColor // 폰트 색상
        // MARK: - 숫자 영역(title)
        cv.appearance.titleFont = UIFont(name: FontManager.NanumGothicBold, size: 11) // 숫자 1~31일 폰트 설정
        cv.appearance.titleWeekendColor = AppColors.shared.fsCalendarTitleWeekendColor // 폰트 색상
        // MARK: - 투데이 영역
        cv.today = nil // 오늘 날짜 원을 제거
        // MARK: - 메모 영역(subtitle)
        cv.appearance.subtitleFont = UIFont(name: FontManager.NanumGothicBold, size: 10)
        // MARK: - 선택 기능
//        cv.allowsMultipleSelection = true // 다중 선택 가능
//        cv.swipeToChooseGesture.isEnabled = true // 스크롤 기능으로 여러개 선택 가능

        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.shared.mainBackGroundColor
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        [fsCalendarView].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func setupLayout() {
        fsCalendarView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(self.snp.centerY).offset(300)
        }
    }
    
    
}
