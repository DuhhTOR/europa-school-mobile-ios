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
        
        return dateFormatter
    }()
    private let calendarView: CalendarView = {
        return CalendarView(frame: UIScreen.main.bounds)
    }()
    private enum dateFormats: String {
        case monthNameYear = "LLLL yyyy"
        case yearMonthDay = "yyyy MM dd"
    }
    private var events: [String] = [
        "2023 03 02",
        "2023 03 17",
        "2023 03 20",
    ]
    

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = calendarView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.calendarCollectionViewHeader.delegate = self
        calendarView.calendarCollectionView.calendarDelegate = self
        calendarView.calendarCollectionView.calendarDataSource = self
        calendarView.calendarCollectionView.scrollToDate(Date(), animateScroll: false)
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
            calendar,
            willDisplay: cell,
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
    
    
    func configureCalendar(
        _ calendar: JTAppleCalendar.JTACMonthView
    ) -> JTAppleCalendar.ConfigurationParameters {
        let startDate = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        let endDate = Calendar.current.date(byAdding: .month, value: 9, to: Date())!
        
        Self.dateFormatter.dateFormat = dateFormats.monthNameYear.rawValue
        calendarView.calendarCollectionViewHeader.configureCurrentSelectedMonthLabel(
            with: Self.dateFormatter.string(from: startDate)
        )
        
        return ConfigurationParameters(
            startDate: startDate,
            endDate: endDate,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .monday,
            hasStrictBoundaries: true
        )
    }
    
    
    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let helper = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let this_date = calendar.visibleDates().monthDates.first(where: {
            (helper?.component(NSCalendar.Unit.day, from: $0.date))! == 1
        })?.date as Any
        let localDate = Date(
            timeInterval: TimeInterval(Calendar.current.timeZone.secondsFromGMT()),
            since: this_date as! Date
        )
        Self.dateFormatter.dateFormat = dateFormats.monthNameYear.rawValue
        
        calendarView.calendarCollectionViewHeader.configureCurrentSelectedMonthLabel(
            with: Self.dateFormatter.string(from: localDate)
        )
    }
    
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell as? CalendarCellView else {
            return
        }
        
        if (cell.isEventSet) {
            self.present(EventViewController(), animated: true, completion: nil)
        }
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
    }
    
    
    private func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? CalendarCellView else {
            return
        }
        
        cell.configureDayLabel(text: cellState.text)
        handleCellStyling(cell: cell, cellState: cellState)
    }
    
    
    private func handleCellStyling(cell: CalendarCellView, cellState: CellState) {
        Self.dateFormatter.dateFormat = dateFormats.yearMonthDay.rawValue
        
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
        
        if cellState.day == .monday {
            let currentRow = cellState.row()
            
            if (currentRow == 4 || currentRow == 5) {
                cell.configureDayLabelWrapperView(cornerRadius: 2)
            }
            
            cell.configureDayLabelWrapperView(backgroundColor: UIColor.calendarColors.cell.firstDayOfWeek)
        } else {
            cell.configureDayLabelWrapperView(backgroundColor: UIColor.clear)
            cell.configureDayLabelWrapperView(cornerRadius: 0)
        }
        
        if(events.contains(Self.dateFormatter.string(from: cellState.date))) {
            cell.addEvent()
        }
    }
    
    
    private func isDateHoliday(date: String) -> Bool {
        for holiday in Calendar.latvianHolidays.allCases {
            if date.contains(holiday.rawValue) {
                return true
            }
        }
        
        return false
    }
    
}


extension CalendarViewController: CalendarCollectionViewHeaderDelegate {
    
    func didTapPreviousMonthButton() {
        calendarView.calendarCollectionView.scrollToSegment(.previous)
    }

    
    func didTapNextMonthButton() {
        calendarView.calendarCollectionView.scrollToSegment(.next)
    }
    
}
