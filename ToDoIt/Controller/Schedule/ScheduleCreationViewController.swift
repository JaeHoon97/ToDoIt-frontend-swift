//
//  ScheduleCreationViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit

final class ScheduleCreationViewController: UIViewController {
    
    // MARK: - 프로퍼티 세팅
    private let scheduleCreationView = ScheduleCreationView()
    private let scrollView = UIScrollView()
    
    var delegate: SendScheduleData?
    
    // MARK: - 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        setupAddTargets()
        setupScrollView()
    }
    
    // MARK: - UI 세팅
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - 델리게이트 세팅
    private func setupDelegates() {
        scheduleCreationView.memoTextView.delegate = self
        scrollView.delegate = self
    }
    
    // MARK: - 스크롤 뷰 세팅
    private func setupScrollView() {
        scrollView.keyboardDismissMode = .onDrag // 스크롤 뷰가 스크롤되는 순간 키보드 제거
        
        [scrollView].forEach {
            self.view.addSubview($0)
        }
        scrollView.addSubview(scheduleCreationView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
        
        scheduleCreationView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
            $0.height.equalTo(800)
        }
    }
    
    // MARK: - 애드 타켓 세팅
    private func setupAddTargets() {
        scheduleCreationView.allDaySwitch.addTarget(self, action: #selector(allDaySwitchTapped), for: .valueChanged)
        scheduleCreationView.createScheduleButton.addTarget(self, action: #selector(createScheduleButtonTapped), for: .touchUpInside)
        scheduleCreationView.startDate.addTarget(self, action: #selector(startDateValueChanged(_ :)), for: .valueChanged)
        
        [scheduleCreationView.redColorButton, scheduleCreationView.greenColorButton, scheduleCreationView.blueColorButton, scheduleCreationView.yellowColorButton, scheduleCreationView.orangeColorButton].forEach {
            $0.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .touchUpInside)
        }
    }

    private func getFormattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
    // MARK: - 일정의 시간에 1시간을 더해주는 함수
    private func plusOneHour(date: Date) -> Date {
        let currentDate = Date()
        let oneHourAfter = Calendar.current.date(byAdding: .hour, value: 1, to: date)
        return oneHourAfter ?? currentDate
    }
    
    // MARK: - 스위치 값의 따라 데이트피커의 속성이 바뀜(dateAndTime <-> date)
    @objc func allDaySwitchTapped() {
        if (scheduleCreationView.allDaySwitch.isOn) { // 하루 종일 스위치가 활성화 상태로 전환됐을 때
            scheduleCreationView.startDate.datePickerMode = .date // 날짜만 나오는 포맷으로 변경. 시간은 표시x
            scheduleCreationView.endDate.datePickerMode = .date // 날짜만 나오는 포맷으로 변경. 시간은 표시x
            scheduleCreationView.endDate.date = scheduleCreationView.startDate.date // 시작 날짜와 종료 날짜를 같게
        } else { // 하루 종일 스위치가 비활성화 상태로 전환됐을 때
            scheduleCreationView.startDate.datePickerMode = .dateAndTime // 날짜와 시간 모두 나오는 포맷으로 변경
            scheduleCreationView.endDate.datePickerMode = .dateAndTime // 날짜와 시간 모두 나오는 포맷으로 변경
            scheduleCreationView.startDate.date = Date()
            scheduleCreationView.endDate.date = plusOneHour(date: Date())
        }
    }
    
    // MARK: - 시작 날짜를 변경했을 때
    @objc func startDateValueChanged(_ sender : UIDatePicker) {
        if(scheduleCreationView.allDaySwitch.isOn) { // 하루 종일 스위치가 활성화 상태일 경우
            scheduleCreationView.endDate.date = sender.date // 시작 날짜와 종료 날짜를 같게 설정
        }
    }
    
    // MARK: - 일정 생성 버튼을 클릭했을 때 일정을 생성하고 캘린더 화면으로 이동하기
    @objc func createScheduleButtonTapped() {
        let startDate = getFormattedDate(date: scheduleCreationView.startDate.date)
        let endDate = getFormattedDate(date: scheduleCreationView.endDate.date)
        print(
            scheduleCreationView.scheduleTitleTextField.text!,
            startDate,
            endDate,
            scheduleCreationView.colorView.backgroundColor!,
            scheduleCreationView.allDaySwitch.isOn,
            scheduleCreationView.memoTextView.text!
            
        )
        delegate?.SendScheduleData(title: scheduleCreationView.scheduleTitleTextField.text!)
        dismiss(animated: true)
    }
    
    // MARK: - 색상을 변경할 때 일정의 배경색상을 같은 색상으로 변경
    @objc func colorButtonTapped(_ sender: UIButton) {
        scheduleCreationView.colorView.backgroundColor = sender.backgroundColor
        scheduleCreationView.createScheduleButton.backgroundColor = sender.backgroundColor
    }
    
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - 텍스트 뷰의 텍스트 홀더를 만들기
extension ScheduleCreationViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메모를 작성하세요"
            textView.textColor = .placeholderText
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if estimatedSize.height <= 100 {
            
            }
            else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
    
}

// MARK: - 스크롤 뷰의 동작을 감지
extension ScheduleCreationViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if(scheduleCreationView.memoTextView.isFirstResponder) {
            scheduleCreationView.memoTextView.resignFirstResponder()
        }
        if(scheduleCreationView.scheduleTitleTextField.isFirstResponder) {
            scheduleCreationView.scheduleTitleTextField.resignFirstResponder()
        }
        self.view.endEditing(true)
    }
}

protocol SendScheduleData {
    func SendScheduleData(title: String)
}
