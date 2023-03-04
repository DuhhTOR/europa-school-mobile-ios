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
    private lazy var eventIconView: UIView = {
        let eventIconView = UIView()
        let circleImageView1 = UIImageView()
        let circleImageView2 = UIImageView()
        let stackView = UIStackView()
        
        eventIconView.translatesAutoresizingMaskIntoConstraints = false
        circleImageView1.image = UIImage(named: "CircleIcon.Orange")
        circleImageView1.contentMode = .scaleAspectFit
        circleImageView2.image = UIImage(named: "CircleIcon.Orange")
        circleImageView2.contentMode = .scaleAspectFit
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(circleImageView1)
        stackView.addArrangedSubview(circleImageView2)
        eventIconView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: eventIconView.safeAreaLayoutGuide.topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 14),
            stackView.centerXAnchor.constraint(equalTo: eventIconView.safeAreaLayoutGuide.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: eventIconView.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        return eventIconView
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
    
    
    public func addEvent() {
        dayLabelWrapperView.addSubview(eventIconView)
        
        NSLayoutConstraint.activate([
            eventIconView.topAnchor.constraint(equalTo: dayLabel.safeAreaLayoutGuide.bottomAnchor),
            eventIconView.leadingAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.leadingAnchor),
            eventIconView.trailingAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.trailingAnchor),
            eventIconView.bottomAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

