//
//  CalendarCellView.swift
//  EiropasSkola
//
//  Created by Ervins on 02/02/2023.
//

import UIKit
import JTAppleCalendar


class CalendarCellView: JTACDayCell {
    
    // MARK: - Private variables
    
    private let dayLabelWrapperView: UIView = {
        let labelWrapperView = UIView()
        labelWrapperView.layer.cornerRadius = 2
        labelWrapperView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelWrapperView
    }()
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.font = UIFont(name: "IBMPlexSans-Medium", size: 14)
        dayLabel.textAlignment = .center
        dayLabel.layer.masksToBounds = true
        dayLabel.layer.cornerRadius = 2
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
                
        return dayLabel
    }()
    
    // MARK: - Public variables
    
    public static let identifier = "CalendarCellView"
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dayLabelWrapperView.addSubview(dayLabel)
        addSubview(dayLabelWrapperView)
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
            dayLabelWrapperView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dayLabelWrapperView.widthAnchor.constraint(equalToConstant: 28),
            dayLabelWrapperView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            dayLabelWrapperView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            dayLabel.widthAnchor.constraint(equalToConstant: 28),
            dayLabel.heightAnchor.constraint(equalToConstant: 28),
            dayLabel.centerYAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    
    // MARK: - Public functions
    
    public func configureDayLabel(text: String) {
        dayLabel.text = text
    }
    
    
    public func configureDayLabel(textColor: UIColor) {
        dayLabel.textColor = textColor
    }
    
    
    public func configureDayLabel(backgroundColor: UIColor) {
        dayLabel.backgroundColor = backgroundColor
    }
    
    
    public func configureDayLabelWrapperView(backgroundColor: UIColor) {
        dayLabelWrapperView.backgroundColor = backgroundColor
    }
    
    public func configureDayLabelWrapperView(cornerRadius: CGFloat) {
        dayLabelWrapperView.clipsToBounds = true
        dayLabelWrapperView.layer.cornerRadius = cornerRadius
        dayLabelWrapperView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
}

