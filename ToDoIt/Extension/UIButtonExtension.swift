//
//  UIButtonExtension.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit

extension UIButton {
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        
        setAttributedTitle(attributedString, for: .normal)
    }
}
