//
//  Model.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit

// MARK: - 섹션 정의
enum Section: Hashable, CaseIterable{
    case schedule
    case todo
}

// MARK: - 아이템 정의
enum Item: Hashable {
    case schedule(Schedule)
    case todo(ToDo)
}

struct Schedule: Hashable {
    let id: UUID = UUID()
    var mainTitle: String
    
    init(mainTitle: String) {
        self.mainTitle = mainTitle
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

struct ToDo: Hashable {
    let id: UUID = UUID()
    var mainTitle: String
    
    init(mainTitle: String) {
        self.mainTitle = mainTitle
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}


