//
//  CalendarViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit
import JTAppleCalendar


class CalendarViewController: UIViewController {
    
    // MARK: - Private variables
    
    private let calendarView: CalendarView = {
        return CalendarView(frame: UIScreen.main.bounds)
    }()
    

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = calendarView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.calendarCollectionView.calendarDelegate = self
        calendarView.calendarCollectionView.calendarDataSource = self
    }

}

 
extension CalendarViewController: JTACMonthViewDelegate, JTACMonthViewDataSource {
    func calendar(
        _ calendar: JTAppleCalendar.JTACMonthView,
        willDisplay cell: JTAppleCalendar.JTACDayCell,
        forItemAt date: Date,
        cellState: JTAppleCalendar.CellState,
        indexPath: IndexPath
    ) {
        
    }
    
    func calendar(
        _ calendar: JTAppleCalendar.JTACMonthView,
        cellForItemAt date: Date,
        cellState: JTAppleCalendar.CellState,
        indexPath: IndexPath
    ) -> JTAppleCalendar.JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: CalendarCellView.identifier, for: indexPath) as! CalendarCellView
        cell.dayLabel.text = cellState.text
        
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendar.JTACMonthView) -> JTAppleCalendar.ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        
        return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 5, firstDayOfWeek: .monday)
    }
    
    
}

