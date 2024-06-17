//
//  HomeViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    // MARK: - 오늘 날짜를 원하는 설정으로 변환
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "M월 d일 (E)"
        df.locale = Locale(identifier: "ko_KR")
        return df
    }()
    
    // MARK: - View 교체
    override func loadView() {
        self.view = homeView
    }
    
    // MARK: - 초기화 세팅
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupDelegates()
    }
    
    // MARK: - Navigation 세팅
    private func setupNavigation() {
        self.navigationItem.title = dateFormatter.string(from: Date())
    }
    
    // MARK: - Delegate 세팅
    private func setupDelegates() {
        homeView.toDoTableView.delegate = self
    }
    
}

extension HomeViewController: UITableViewDelegate {
    // MARK: - 셀 높이를 세팅
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
