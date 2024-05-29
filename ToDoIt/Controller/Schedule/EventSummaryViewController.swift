//
//  EventSummaryViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/26/24.
//
// MARK: - 캘린더에서 원하는 날짜를 선택했을 때 팝업되는 이벤트 요약 뷰 컨트롤러
import UIKit
import SnapKit

final class EventSummaryViewController: UIViewController {
    
    let eventSummaryView = EventSummaryView()
    
    // MARK: - 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupTapGesture()
        setupDelegates()
        setupAddTargets()
    }
    
    // MARK: - UI 세팅
    private func setupUI() {
        [eventSummaryView].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Layout 세팅
    private func setupLayout() {
        eventSummaryView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    // MARK: - Delegate 세팅
    private func setupDelegates() {
        eventSummaryView.eventTableView.delegate = self
    }
    
    // MARK: - 버튼 클릭 감지 이벤트 세팅
    private func setupAddTargets() {
        eventSummaryView.createEventButton.addTarget(self, action: #selector(createEventButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - 화면 밖을 탭 했을 때 제스처 등록
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside(_:))) // 화면 밖을 클릭했을 때 제스처 세팅
        view.addGestureRecognizer(tapGesture) // eventSummaryView에 tapGesture 등록
    }
    
    // MARK: - 개인일정 생성 버튼을 클릭했을 때
    @objc private func createEventButtonTapped() {
        Haptics.Shared.generateLightHaptics()
        let scheduleCreationViewController = ScheduleCreationViewController()
        present(scheduleCreationViewController, animated: true)
    }
    
    // MARK: - 만약 eventSummaryView영역 밖을 탭했을 경우 eventSummaryView를 dismiss
    @objc private func handleTapOutside(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if !eventSummaryView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }

}

// MARK: - 테이블 뷰 세팅
extension EventSummaryViewController: UITableViewDelegate {
    
    // MARK: - 셀 높이를 세팅
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}
