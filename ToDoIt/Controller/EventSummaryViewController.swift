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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupTapGesture()
    }
    
    private func setupUI() {
        [eventSummaryView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        eventSummaryView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    // MARK: - 화면을 탭 했을 때 감지 이벤트 등록
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - 탭했을 때를 감지하고 만약 eventSummaryView영역 밖을 탭했을 경우 eventSummaryView를 dismiss
    @objc private func handleTapOutside(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if !eventSummaryView.frame.contains(location) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
