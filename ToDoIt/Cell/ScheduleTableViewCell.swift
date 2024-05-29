//
//  PersonalScheduleTableViewCell.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit
import SnapKit

final class ScheduleTableViewCell: UITableViewCell {
    static let ID = "ScheduleTableViewCell"
    
    var mainColorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.shared.buttonBackGroundColor
        view.clipsToBounds = true
        return view
    }()
    
    var mainText: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: FontManager.NanumGothic, size: 13)
        lb.textAlignment = .left
        lb.textColor = .black
        lb.backgroundColor = .clear
        return lb
    }()
    
    let checkButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setImage(UIImage(systemName: "square"), for: .normal)
        bt.backgroundColor = .clear
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
    }
    
    private func setupUI() {
        [mainColorView, mainText, checkButton].forEach {
            self.contentView.addSubview($0)
        }
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = AppColors.shared.tableViewCellBackGroundColor
        self.contentView.layer.cornerRadius = 7
        self.contentView.layer.masksToBounds = true
    }
    
    private func setupLayout() {
        mainColorView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.02)
        }
        
        mainText.snp.makeConstraints { make in
            make.leading.equalTo(mainColorView.snp.trailing).offset(10)
            make.trailing.equalTo(checkButton.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(self.contentView.snp.height)

        }
    }
    
    
}
