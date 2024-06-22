//
//  DateManager.swift
//  ToDoIt
//
//  Created by 재훈 on 6/21/24.
//

import Foundation
import UIKit

final class DateManager {
    
    static let shared = DateManager()
    private init() {}
    
    // MARK: - 년/월/일 달력
    func getFullDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년M월dd일"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: - 년/월 달력
    func getYearAndMonthDate(_ date: Date) -> String! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 M월"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    
    // MARK: - 음력 달력
    func getLunarDate(_ date: Date) -> String! {
        let lunarCalendar = Calendar(identifier: .chinese)
        let currentDate = date
        let lunarComponents = lunarCalendar.dateComponents([.year, .month, .day], from: currentDate)
        
        let formatter = DateFormatter()
        formatter.calendar = lunarCalendar
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.dateFormat = "MM.dd"
        
        guard let lunarDate = lunarCalendar.date(from: lunarComponents) else { return nil }
        let lunarDateString = formatter.string(from: lunarDate)
        return "음력 \(lunarDateString)"
    }
    
    // MARK: - 일/요일 달력
    func getDayAndWeekDate(_ date: Date) -> String! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd. E"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    

    
}
