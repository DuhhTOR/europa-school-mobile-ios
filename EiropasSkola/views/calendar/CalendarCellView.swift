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
    public let dayLabel: UILabel = {
        let dayLabel = UILabel()
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
    
}

