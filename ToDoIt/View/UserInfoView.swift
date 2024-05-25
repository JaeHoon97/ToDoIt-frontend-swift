//
//  UserInfoView.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//

import UIKit

final class UserInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.shared.mainBackGroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
