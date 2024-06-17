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
    
    var eventsArray: [String] = ["2024-05-05-일", "2024-05-16-목", "2024-05-24-금", "2024-05-30-목"]
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MM월 dd일 (E)"
        df.locale = Locale(identifier: "ko_KR")
        return df
    }()
    
    override func loadView() {
        self.view = scheduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
    
    private func setupDelegates() {
        scheduleView.fsCalendarView.delegate = self
        scheduleView.fsCalendarView.dataSource = self
    }
    


}

extension ScheduleViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//    
//    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return nil
    }
    
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        
//        let dateFormatter = self.dateFormatter
//        
//        switch dateFormatter.string(from: date) {
//            
//        case dateFormatter.string(from: Date()):
//            return "오늘"
//        default:
//            return nil
//               
//        }
//        
//    }
    
    // MARK: - 날짜를 선택했을 때
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        // 사용자가 날짜를 클릭했을 때 진동 발생
        Haptics.Shared.generateLightHaptics()
        
        let selectedDate = dateFormatter.string(from: date)
        print(selectedDate)
        let eventSummaryViewController = EventSummaryViewController()
        eventSummaryViewController.modalPresentationStyle = .overFullScreen
        eventSummaryViewController.eventSummaryView.eventDate.text = selectedDate
        present(eventSummaryViewController, animated: true)
    }
    
    // MARK: - 등록된 이벤트의 날짜들을 이벤트 점으로 표시
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        return 5
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let eventScaleFactor: CGFloat = 0.8
        cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor) // 이벤트 표시 작은 원 사이즈
        cell.layer.borderColor = UIColor.clear.cgColor
    }

    
    
}


    
