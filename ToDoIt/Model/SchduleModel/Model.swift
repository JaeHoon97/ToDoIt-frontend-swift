//
//  Model.swift
//  ToDoIt
//
//  Created by 재훈 on 5/29/24.
//

import UIKit

// MARK: - 섹션 정의
enum Section: Hashable, CaseIterable {
    case main
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


