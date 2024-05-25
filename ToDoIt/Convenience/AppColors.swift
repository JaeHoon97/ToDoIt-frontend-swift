//
//  AppColors.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//

import UIKit

final class AppColors {
    
    static let shared = AppColors()
    
    private init() {}
    
    let TextFieldBackGroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    let TextFieldBorderColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    let TextFieldPlaceHolderColor = #colorLiteral(red: 0.6399999857, green: 0.6399999857, blue: 0.6399999857, alpha: 1)
    
    let buttonBackGroundColor = #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
    let buttonTextColor = #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
    
    let mainBackGroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 1, alpha: 1)
    
    let tabBarBackGroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 1, alpha: 1)
    // #colorLiteral(red: 0.5843137255, green: 0.7411764706, blue: 1, alpha: 1)
    // #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
}
