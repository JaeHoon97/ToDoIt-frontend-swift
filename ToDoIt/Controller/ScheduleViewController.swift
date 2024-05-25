//
//  ScheduleViewController.swift
//  ToDoIt
//
//  Created by 재훈 on 5/25/24.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    private let scheduleView = ScheduleView()
    
    override func loadView() {
        self.view = scheduleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
