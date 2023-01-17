//
//  CalendarViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit


class CalendarViewController: UIViewController {
    
    // MARK: - Private variables
    
    public let calendarView: CalendarView = {
        return CalendarView(frame: UIScreen.main.bounds)
    }()
    

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = calendarView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

