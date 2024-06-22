//
//  ScheduleCreationView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit
import SnapKit

final class ScheduleCreationView: UIView {
    
    // MARK: - 일정 제목 옆 색상 뷰
    let colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = AppColors.shared.buttonBackGroundColor
        return view
    }()
    
    // MARK: - 일정 제목을 작성
    let scheduleTitleTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "제목", attributes: [NSAttributedString.Key.foregroundColor: AppColors.shared.TextFieldPlaceHolderColor])
        tf.font = UIFont(name: FontManager.Jalnan2, size: 19)
        tf.textColor = .black
        tf.backgroundColor = .clear
        tf.layer.borderColor = AppColors.shared.TextFieldBorderColor.cgColor
        tf.clipsToBounds = true
        tf.keyboardType = .default
        tf.autocapitalizationType = .none // 자동 대문자 비활성화
        tf.autocorrectionType = .no // 자동 교정 비활성화
        tf.spellCheckingType = .no // 스펠링 확인 비활성화
        tf.returnKeyType = .done // 엔터키는 완료로 표시
        tf.leftPadding() // 뷰와 텍스트간의 왼쪽 패딩을 설정하여 가독성을 높임
        return tf
    }()
    
    // MARK: - 일정 제목 및 색상 뷰를 담고있는 스택뷰
    let textFieldStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.backgroundColor = .clear
        sv.spacing = 1
        return sv
    }()
    
    // MARK: - 섹션을 나누기 위한 구분선
    private let divisionColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    // MARK: - 일정 생성 시 시작 날짜
    let startDate: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.preferredDatePickerStyle = .compact
        dp.locale = Locale(identifier: "ko_KR") // 한국으로 설정하면 텍스트가 한글로 출력
        return dp
    }()
    
    // MARK: - 일정 시작 화살표 이미지
    let startDateImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "RightArrow")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - 시작 일정 및 시작 이미지를 담고 있는 스택뷰
    let startDateStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.backgroundColor = .clear
        sv.spacing = 30
        return sv
    }()
    
    // MARK: - 일정 생성 시 종료 날짜
    let endDate: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.preferredDatePickerStyle = .compact
        dp.locale = Locale(identifier: "ko_KR") // 한국으로 설정하면 텍스트가 한글로 출력
        let currentDate = Date()
        let oneHourAfter = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)
        dp.date = oneHourAfter ?? currentDate
        return dp
    }()
    
    // MARK: - 일정 종료 화살표 이미지
    let endDateImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "LeftArrow")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - 종료 일정 및 종료 이미지를 담고 있는 스택뷰
    let endDateStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.backgroundColor = .clear
        sv.spacing = 10
        return sv
    }()
    
    // MARK: - 하루 종일 레이블
    let allDayLabel: UILabel = {
        let lb = UILabel()
        lb.text = "하루 종일"
        lb.font = UIFont(name: FontManager.Jalnan2, size: 16)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    // MARK: -  하루 종일 스위치
    let allDaySwitch: UISwitch = {
        let sw = UISwitch()
        sw.isOn = false
        return sw
    }()
    
    // MARK: - 하루 종일 스위치 및 하루 종일 레이블을 담고 있는 스택뷰
    let allDayStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.backgroundColor = .clear
        return sv
    }()
    
    // MARK: - 일정 색상 레이블
    let colorLabel: UILabel = {
        let lb = UILabel()
        lb.text = "색상"
        lb.font = UIFont(name: FontManager.Jalnan2, size: 16)
        lb.textColor = .black
        lb.clipsToBounds = true
        return lb
    }()
    
    let redColorButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = AppColors.shared.scheduleMainBackGroundColors[0]
        bt.clipsToBounds = true
        return bt
    }()
    
    let greenColorButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = AppColors.shared.scheduleMainBackGroundColors[1]
        bt.clipsToBounds = true
        return bt
    }()
    
    let blueColorButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = AppColors.shared.scheduleMainBackGroundColors[2]
        bt.clipsToBounds = true
        return bt
    }()
    
    let yellowColorButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = AppColors.shared.scheduleMainBackGroundColors[3]
        bt.clipsToBounds = true
        return bt
    }()
    
    let orangeColorButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = AppColors.shared.scheduleMainBackGroundColors[4]
        bt.clipsToBounds = true
        return bt
    }()
    
    // MARK: - 일정 색상 피커와 일정 색상 레이블을 담고 있는 스택뷰
    let colorStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.backgroundColor = .clear
        sv.spacing = 30
        return sv
    }()
    
    // MARK: - 일정 메모 텍스트 뷰
    let memoTextView: UITextView = {
        let tv = UITextView()
        tv.text = "메모를 작성하세요"
        tv.font = UIFont(name: FontManager.Jalnan2, size: 14)
        tv.textColor = .placeholderText
        tv.backgroundColor = .systemGray6
        tv.textContainerInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        tv.layer.cornerRadius = 20
        tv.isScrollEnabled  = false
        return tv
    }()
    
    // MARK: - 일정 생성 완료 버튼
    let createScheduleButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("생성하기", for: .normal)
        bt.titleLabel?.font = UIFont(name: FontManager.Jalnan2, size: 15)
        bt.backgroundColor = AppColors.shared.buttonBackGroundColor
        bt.titleLabel?.textAlignment = .center
        bt.titleLabel?.textColor = .white
        bt.clipsToBounds = false
        bt.layer.cornerRadius = 10
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        [textFieldStackView, divisionColorView, startDateStackView, endDateStackView, allDayStackView, memoTextView, createScheduleButton, colorStackView].forEach {
            addSubview($0)
        }
        
        [colorView, scheduleTitleTextField]
            .forEach { textFieldStackView.addArrangedSubview($0) }
        [startDateImageView, startDate]
            .forEach { startDateStackView.addArrangedSubview($0)}
        [endDateImageView, endDate]
            .forEach { endDateStackView.addArrangedSubview($0)}
        [allDayLabel, allDaySwitch]
            .forEach { allDayStackView.addArrangedSubview($0)}
        [colorLabel, redColorButton, greenColorButton, blueColorButton, yellowColorButton, orangeColorButton]
            .forEach { colorStackView.addArrangedSubview($0)}
    }
    
    private func setupLayout() {
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(30)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(40)
        }
        
        colorView.snp.makeConstraints {
            $0.width.equalTo(7)
        }
        
        divisionColorView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(1)
        }
        
        allDayStackView.snp.makeConstraints {
            $0.top.equalTo(divisionColorView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(30)
        }
        
        startDateStackView.snp.makeConstraints {
            $0.top.equalTo(allDayStackView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(30)
        }
        
        startDateImageView.snp.makeConstraints {
            $0.width.equalTo(startDateStackView.snp.height)
        }
        
        endDateStackView.snp.makeConstraints {
            $0.top.equalTo(startDateImageView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(30)
        }
        
        endDateImageView.snp.makeConstraints {
            $0.width.equalTo(endDateStackView.snp.height)
        }
        
        colorStackView.snp.makeConstraints {
            $0.top.equalTo(endDateStackView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(30)
        }
        
        [redColorButton, greenColorButton, blueColorButton, yellowColorButton, orangeColorButton].forEach { button in
            button.layer.cornerRadius = 15
            button.snp.makeConstraints {
                $0.width.equalTo(colorStackView.snp.height)
            }
        }
        
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(colorStackView.snp.bottom).offset(40)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(100)
        }
        
        createScheduleButton.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.top.equalTo(memoTextView.snp.bottom).offset(40)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(42.5)
        }
    
    }
    // MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

}
