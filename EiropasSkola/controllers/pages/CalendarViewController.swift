//
//  CalendarViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit


class CalendarViewController: UIViewController {
    
    // MARK: - Private variables
    
    private let calendarView: CalendarView = {
        return CalendarView(frame: UIScreen.main.bounds)
    }()
    

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = calendarView
    }

}

