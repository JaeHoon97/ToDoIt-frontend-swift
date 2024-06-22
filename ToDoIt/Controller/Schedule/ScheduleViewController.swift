//
//  ScheduleViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//
// MARK: - 캘린더에서 원하는 날짜를 선택했을 때 팝업되는 이벤트 요약 뷰 컨트롤러

import UIKit
import FSCalendar

final class ScheduleViewController: UIViewController {
    
    private let scheduleView = ScheduleView()
    
    private let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.preferredDatePickerStyle = .wheels
        dp.locale = Locale(identifier: "ko_KR")
        dp.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return dp
    }()
    
    var eventsArray: [String] = ["2024-05-05-일", "2024-05-16-목", "2024-05-24-금", "2024-05-30-목"]
    
    // MARK: - 뷰 교체
    override func loadView() {
        self.view = scheduleView
    }
    
    // MARK: - 초기화
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupNavigations()
    }
    
    // MARK: - 델리게이트 관련 설정
    private func setupDelegates() {
        scheduleView.fsCalendarView.delegate = self
        scheduleView.fsCalendarView.dataSource = self
    }
    
    // MARK: - 네비게이션 관련 설정
    private func setupNavigations() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        createRightBarButtonItem()
        createLeftBarButtonItem()
    }
    
    // MARK: - 네비게이션 왼쪽 바 버튼 아이템 생성 및 설정
    private func createLeftBarButtonItem() {
        scheduleView.naviDateLabel.text = DateManager.shared.getYearAndMonthDate(Date())
        
        let leftBarButtonItem = UIBarButtonItem(customView: scheduleView.naviDateLabel)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    // MARK: - 네비게이션 오른쪽 바 버튼 아이템 생성 및 설정
    private func createRightBarButtonItem() {
        let addImage = UIImage(named: "Add")! // 플러스 이미지
        let searchImage = UIImage(systemName: "magnifyingglass")! // 검색 이미지
        
        let addScheduleButton = UIButton(frame: CGRect(x: 0, y: 0, width: addImage.size.width, height: addImage.size.height)) // 개인일정 생성 버튼
        let searchScheduleButton = UIButton(frame: CGRect(x: 0, y: 0, width: searchImage.size.width, height: searchImage.size.height)) // 개인일정 검색 버튼
        
        addScheduleButton.addTarget(self, action: #selector(addScheduleButtonTapped), for: .touchUpInside) // 터치 시 이벤트 등록
        searchScheduleButton.addTarget(self, action: #selector(searchScheduleButtonTapped), for: .touchUpInside) // 터치 시 이벤트 등록
        
        addScheduleButton.tintColor = .black // 버튼의 색상 검정
        searchScheduleButton.tintColor = .black // 버튼의 색상 검정
        
        addScheduleButton.setImage(addImage, for: .normal) // 버튼 이미지 설정
        searchScheduleButton.setImage(searchImage, for: .normal) // 버튼 이미지 설정
        
        let stackView = UIStackView.init(arrangedSubviews: [searchScheduleButton, addScheduleButton]) // 버튼들을 담을 스택뷰
        stackView.axis = .horizontal // 수평 축
        stackView.distribution = .equalSpacing // 동일 분배
        stackView.alignment = .center // 가운데 정렬
        stackView.spacing = 30 // 간격
        
        let stackBarButtonItem = UIBarButtonItem(customView: stackView) // 커스텀한 스택뷰를 바 버튼 아이템으로 설정
        
        self.navigationItem.rightBarButtonItem = stackBarButtonItem // 오른쪽 바 버튼 아이템에 커스텀 스택 뷰를 설정
    }
    
    func changeDateLabelTextColor() {
        if(isContainsSunAndSat(scheduleView.dateLabel.text!)) {
            scheduleView.dateLabel.textColor = AppColors.shared.fsCalendarTitleWeekendColor
        } else {
            scheduleView.dateLabel.textColor = .black
        }
    }
    
    func isContainsSunAndSat(_ text: String) -> Bool {
        if(text.contains("토") || text.contains("일")) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - 개인일정 생성 버튼을 클릭했을 때
    @objc private func addScheduleButtonTapped() {
        let scheduleCreationViewController = ScheduleCreationViewController()
        navigationController?.pushViewController(scheduleCreationViewController, animated: true)
    }
    
    // MARK: - 개인일정 검색 버튼을 클릭했을 때
    @objc private func searchScheduleButtonTapped() {
        print("search")
    }
    
    @objc func dateTextTapped() {
        
    }
    
    // MARK: - 데이트 피커의 값을 변경했을 때
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }
    

}

extension ScheduleViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//    
//    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return .lightGray
    }
    
    // MARK: - 날짜를 선택했을 때
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 사용자가 날짜를 클릭했을 때 진동 발생
        Haptics.Shared.generateLightHaptics()
        scheduleView.dateLabel.text = DateManager.shared.getDayAndWeekDate(date) // 일/요일 날짜
        changeDateLabelTextColor()
        scheduleView.lunarDateLabel.text = DateManager.shared.getLunarDate(date) // 음력 월/일 날짜
    }
    
    // MARK: - 등록된 이벤트의 날짜들을 이벤트 점으로 표시
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        return 0
    }
    
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let eventScaleFactor: CGFloat = 0.8
        cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor) // 이벤트 표시 작은 원 사이즈
        cell.layer.borderColor = UIColor.clear.cgColor
    }
    
    // MARK: - 달력이 스와이프될 때 설정
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        let currentPage = calendar.currentPage
        scheduleView.naviDateLabel.text = DateManager.shared.getYearAndMonthDate(currentPage) //네비게이션 왼쪽 바 버튼 아이템의 날짜 변경
        scheduleView.dateLabel.text = DateManager.shared.getDayAndWeekDate(currentPage) // 일.요일 날짜 변경
        changeDateLabelTextColor()
        scheduleView.lunarDateLabel.text = DateManager.shared.getLunarDate(currentPage) // 음력 월.일 날짜 변경
    }
}


    
