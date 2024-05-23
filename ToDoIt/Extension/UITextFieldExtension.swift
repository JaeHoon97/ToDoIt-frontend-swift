//
//  UITextFieldExtension.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit

extension UITextField {
    func setup() { }
    
    func leftPadding() {
        // 1
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        // 2
        self.leftView = paddingView
        // 3
        self.leftViewMode = ViewMode.always
    }
    
}
