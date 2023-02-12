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
    
    private static let dateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        
        return dateFormatter
    }()
    
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
        cellForItemAt date: Date,
        cellState: JTAppleCalendar.CellState,
        indexPath: IndexPath
    ) -> JTAppleCalendar.JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(
            withReuseIdentifier: CalendarCellView.identifier,
            for: indexPath
        ) as! CalendarCellView
        
        self.calendar(
            calendar, willDisplay: cell,
            forItemAt: date,
            cellState: cellState,
            indexPath: indexPath
        )
        
        return cell
    }
    
    
    func calendar(
        _ calendar: JTAppleCalendar.JTACMonthView,
        willDisplay cell: JTAppleCalendar.JTACDayCell,
        forItemAt date: Date,
        cellState: JTAppleCalendar.CellState,
        indexPath: IndexPath
    ) {
        configureCell(view: cell, cellState: cellState)
    }
    
    
    func configureCalendar(_ calendar: JTAppleCalendar.JTACMonthView) -> JTAppleCalendar.ConfigurationParameters {
        let startDate = Self.dateFormatter.date(from: "2023 01 01")!
        let endDate = Calendar.current.date(byAdding: .month, value: 11, to: startDate)!
        
        return ConfigurationParameters(
            startDate: startDate,
            endDate: endDate,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .monday,
            hasStrictBoundaries: true
        )
    }
    
    
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? CalendarCellView else {
            return
        }
        
        cell.configureDayLabel(text: cellState.text)
        handleCellTextColor(cell: cell, cellState: cellState)
    }
    
    
    func handleCellTextColor(cell: CalendarCellView, cellState: CellState) {
        if isDateHoliday(date: Self.dateFormatter.string(from: cellState.date)) {
            cell.configureDayLabel(textColor: UIColor.calendarColors.label.holiday)
            cell.configureDayLabel(backgroundColor: UIColor.clear)
        } else if cellState.dateBelongsTo != .thisMonth {
            cell.configureDayLabel(textColor: UIColor.calendarColors.label.outDate)
            cell.configureDayLabel(backgroundColor: UIColor.clear)
        } else if Calendar.current.isDate(cellState.date, equalTo: Date(), toGranularity: .day) {
            cell.configureDayLabel(textColor: UIColor.calendarColors.label.today)
            cell.configureDayLabel(backgroundColor: UIColor.calendarColors.cell.today)
        } else if cellState.day == .saturday || cellState.day == .sunday {
            cell.configureDayLabel(textColor: UIColor.calendarColors.label.weekend)
            cell.configureDayLabel(backgroundColor: UIColor.clear)
        } else {
            cell.configureDayLabel(textColor: UIColor.calendarColors.label.normal)
            cell.configureDayLabel(backgroundColor: UIColor.clear)
        }
    }
    
    
    func isDateHoliday(date: String) -> Bool {
        for holiday in Calendar.latvianHolidays.allCases {
            if date.contains(holiday.rawValue) {
                return true
            }
        }
        
        return false
    }
    
}

