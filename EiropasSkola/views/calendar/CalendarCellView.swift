//
//  CalendarCellView.swift
//  EiropasSkola
//
//  Created by Ervins on 02/02/2023.
//

import UIKit
import JTAppleCalendar


class CalendarCellView: JTACDayCell {
    
    // MARK: - Public variables
    
    public static let identifier = "CalendarCellView"
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.textColor = UIColor.calendarDayLabelColors.normal
        dayLabel.font = UIFont(name: "IBMPlexSans-Medium", size: 14)
        dayLabel.textAlignment = .center
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
                
        return dayLabel
    }()
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dayLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overridden functions
    
    override func layoutSubviews() {
        addConstraints()
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            dayLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    // MARK: - Public functions
    
    public func configureDayLabel(with text: String) {
        dayLabel.text = text
    }
    
    
    public func configureDayLabel(with textColor: UIColor?) {
        dayLabel.textColor = textColor
    }
    
}

