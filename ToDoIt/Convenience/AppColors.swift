//
//  AppColors.swift
//  ToDoIt
//
//  Created by 재훈 on 5/23/24.
//
// MARK: - 앱 전반적으로 사용되는 컬러들을 모아놓은 클래스

import UIKit

final class AppColors {
    
    static let shared = AppColors()
    
    private init() {}
    
    // MARK: - 텍스트 필드 색상 세팅
    let TextFieldBackGroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let TextFieldBorderColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    let TextFieldPlaceHolderColor = #colorLiteral(red: 0.6399999857, green: 0.6399999857, blue: 0.6399999857, alpha: 1)
    
    // MARK: - 버튼 색상 세팅
    let buttonBackGroundColor = #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
    let buttonTextColor = #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
    
    // MARK: - 메인 색상 세팅
    let mainBackGroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 1, alpha: 1)
    // MARK: - 탭바 색상 세팅
    let tabBarBackGroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 1, alpha: 1)
    
    // MARK: - 캘린더 색상 세팅
    let fsCalendarweekdayTextColor = #colorLiteral(red: 0.3921568627, green: 0.5843137255, blue: 0.9294117647, alpha: 1)
    let fsCalendarTitleWeekendColor = #colorLiteral(red: 0.9568627451, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
    
    // MARK: - 테이블 뷰 셀 색상 세팅
    let tableViewCellMainColor = #colorLiteral(red: 0.6666666667, green: 0.768627451, blue: 1, alpha: 1)
    let tableViewCellBackGroundColor = #colorLiteral(red: 0.8235294118, green: 0.8784313725, blue: 0.9843137255, alpha: 1)
    
    // MARK: - 일정 색상 세팅
    let scheduleMainBackGroundColors: [UIColor] = [#colorLiteral(red: 1, green: 0.5019607843, blue: 0.5019607843, alpha: 1), #colorLiteral(red: 1, green: 0.8117647059, blue: 0.5882352941, alpha: 1), #colorLiteral(red: 0.4823529412, green: 0.8274509804, blue: 0.9176470588, alpha: 1), #colorLiteral(red: 0.6745098039, green: 0.8823529412, blue: 0.6862745098, alpha: 1), #colorLiteral(red: 0.6980392157, green: 0.6431372549, blue: 1, alpha: 1)]
    
    let dashboardBackGroundColor = #colorLiteral(red: 0.3921568627, green: 0.5843137255, blue: 0.9294117647, alpha: 1)
}
