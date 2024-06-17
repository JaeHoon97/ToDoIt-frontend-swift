//
//  HomeView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//
// MARK: - 메인 화면 기능으로 사용자가 오늘 할 일을 생성, 수정, 삭제
// MARK: - 대쉬보드를 통해 사용자에게 날짜, 진행여부를 표시

import UIKit
import SnapKit

final class HomeView: UIView {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemPink
        sv.alwaysBounceVertical = true // 스크롤 뷰의 높이보다 컨텐츠의 높이가 더 작을 경우에도 스크롤 효과를 보여주게 설정
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    // MARK: - 사용자에게 todo 관련 메시지, 진행률, 막대그래프를 담고있는 View
    private let todoInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - 총 일정 수, 완료 일정 수, 진행률을 담기 위한 수평 스택 View
    private lazy var progressStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [toDoMessageLabel, toDoPercentLabel])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.backgroundColor = .clear
        return sv
    }()
    
    // MARK: - todo 안내 메시지 전달 Label
    private let toDoMessageLabel: UILabel = {
        let lb = UILabel()
        lb.text = "오늘의 ToDo를 달성해보세요!"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 14)
        lb.textColor = AppColors.shared.labelTextColor
        lb.numberOfLines = 1
        lb.textAlignment = .left
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - 완료된 일정 수 / 전체 일정 수 값을 퍼센트로 표시 Label
    private let toDoPercentLabel: UILabel = {
        let lb = UILabel()
        lb.text = "44%"
        lb.font = UIFont(name: FontManager.NanumGothicBold, size: 20)
        lb.textColor = AppColors.shared.labelTextColor
        lb.numberOfLines = 0
        lb.textAlignment = .right
        lb.backgroundColor = .clear
        lb.frame.size = lb.intrinsicContentSize
        return lb
    }()
    
    // MARK: - ToDo의 진행률 progressView
    private let toDoProgressView: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .bar)
        pv.trackTintColor = AppColors.shared.mainBackGroundColor
        pv.progressTintColor = AppColors.shared.buttonBackGroundColor
        pv.progress = 0.4
        return pv
    }()
    
    // MARK: - Todo를 생성하는 버튼과, 생성된 ToDo들을 담고있는 View
    private let todoListView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - ToDo를 생성하는 버튼
    let createToDoButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("+ ToDo를 생성하세요", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.NanumGothicExtraBold, size: 14)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    // MARK: - ToDo 리스트를 보여주기 위한 테이블 뷰
    let toDoTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.ID)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.clipsToBounds = true
        return tv
    }()
    
    var dataSource: UITableViewDiffableDataSource<Section, ToDo>!
    
    var snapshot: NSDiffableDataSourceSnapshot<Section, ToDo>!
    
    var toDoList: [ToDo] = [
        ToDo(mainTitle: "컴퓨터 구조 공부하기"),
        ToDo(mainTitle: "알고리즘 문제 풀기"),
        ToDo(mainTitle: "일요일 8시 홍대 1번 출구"),
        ToDo(mainTitle: "스터디 모임 수요일 6시"),
    ]
    
    // MARK: - 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupDataSourceAndSnapShot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDataSourceAndSnapShot() {
        dataSource = UITableViewDiffableDataSource<Section, ToDo>(tableView: self.toDoTableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.ID, for: indexPath) as! ToDoTableViewCell
            cell.mainText.text = self.toDoList[indexPath.row].mainTitle
            cell.selectionStyle = .none
            return cell
        })
        
        snapshot = NSDiffableDataSourceSnapshot<Section, ToDo>()
        snapshot.appendSections([.todo])
        snapshot.appendItems(toDoList, toSection: .todo)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // UI
    private func setupUI() {
        self.backgroundColor = AppColors.shared.mainBackGroundColor
        
        [scrollView].forEach {
            self.addSubview($0)
        }
        
        [todoInfoView, todoListView].forEach {
            self.scrollView.addSubview($0)
        }
        
        [progressStackView, toDoProgressView].forEach {
            self.todoInfoView.addSubview($0)
        }
        
        [toDoTableView, createToDoButton].forEach {
            self.todoListView.addSubview($0)
        }
    }
    
    
    // Layout
    private func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        todoInfoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(100)
        }
        
        progressStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        toDoProgressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(5)
        }
        
        todoListView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(todoInfoView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(300)
        }
        
        toDoTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        createToDoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(toDoTableView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
}


