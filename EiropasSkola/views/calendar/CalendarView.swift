//
//  CalendarView.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit
import JTAppleCalendar


class CalendarView: UIView {
    
    // MARK: - Private variables
    
    private let calendarHeaderView: CalendarHeaderView = {
        let calendarHeaderView = CalendarHeaderView()
        calendarHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return calendarHeaderView
    }()
    private let dayStackViewContainerView: UIView = {
        let dayStackViewContainerView = UIView()
        dayStackViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        return dayStackViewContainerView
    }()
    private let dayStackView: UIStackView = {
        let dayStackView = UIStackView()
        dayStackView.axis = .horizontal
        dayStackView.distribution = .fillEqually
        
        return dayStackView
    }()
    private enum Days: String, CaseIterable {
        case monday = "P"
        case tuesday = "O"
        case wednesday = "T"
        case thursday = "C"
        case friday = "Pk."
        case saturday = "S"
        case sunday = "Sv."
    }

    
    // MARK: - Public variables
    
    public let calendarCollectionViewHeader: CalendarCollectionViewHeader = {
        let calendarCollectionViewHeader = CalendarCollectionViewHeader()
        calendarCollectionViewHeader.clipsToBounds = true
        calendarCollectionViewHeader.translatesAutoresizingMaskIntoConstraints = false
        
        return calendarCollectionViewHeader
    }()
    public let calendarCollectionView: JTACMonthView = {
        let calendarCollectionView = JTACMonthView()
        calendarCollectionView.minimumLineSpacing = 0
        calendarCollectionView.minimumInteritemSpacing = 0
        calendarCollectionView.register(CalendarCellView.self, forCellWithReuseIdentifier: CalendarCellView.identifier)
        calendarCollectionView.scrollDirection = .horizontal
        calendarCollectionView.isPagingEnabled = true
        calendarCollectionView.backgroundColor = UIColor.clear
        calendarCollectionView.showsHorizontalScrollIndicator = false
        calendarCollectionView.scrollingMode = .stopAtEachSection
        calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return calendarCollectionView
    }()
    
    
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.insertSublayer(CustomGradientLayer.pageGradientLayer(bounds: self.bounds), at: 0)
        
        addSubviews(calendarHeaderView, calendarCollectionViewHeader, dayStackViewContainerView, calendarCollectionView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overridden functions
    
    override func layoutSubviews() {
        addConstraints()
        
        if
            dayStackViewContainerView.frame.size.width != 0
            && !dayStackView.isDescendant(of: dayStackViewContainerView)
        {
            configureDayStackView()
        }
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            calendarHeaderView.heightAnchor.constraint(equalToConstant: 24),
            calendarHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            calendarHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            calendarHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            calendarCollectionViewHeader.topAnchor.constraint(equalTo: calendarHeaderView.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            calendarCollectionViewHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            calendarCollectionViewHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            dayStackViewContainerView.heightAnchor.constraint(equalToConstant: 48),
            dayStackViewContainerView.topAnchor.constraint(equalTo: calendarCollectionViewHeader.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            dayStackViewContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            dayStackViewContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            calendarCollectionView.heightAnchor.constraint(equalToConstant: 248),
            calendarCollectionView.topAnchor.constraint(equalTo: dayStackViewContainerView.safeAreaLayoutGuide.bottomAnchor),
            calendarCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            calendarCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
    
    private func configureDayStackView() {
        dayStackView.frame = CGRect(
            x: 0,
            y: 0,
            width: dayStackViewContainerView.frame.size.width,
            height: dayStackViewContainerView.frame.size.height
        )
        
        for day in Days.allCases {
            let dayLabelWrapperView = UIView()
            let dayLabel = UILabel()
            dayLabel.text = day.rawValue
            dayLabel.textAlignment = .center
            dayLabel.font = UIFont(name: "IBMPlexSans-Medium", size: 14)
            dayLabel.textColor = UIColor.calendarColors.label.outDate
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            
            if (day == .monday) {
                dayLabel.backgroundColor = UIColor.calendarColors.cell.firstDayOfWeek
                dayLabel.clipsToBounds = true
                dayLabel.layer.cornerRadius = 2
                dayLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
            
            dayLabelWrapperView.addSubview(dayLabel)
            
            NSLayoutConstraint.activate([
                dayLabel.widthAnchor.constraint(equalToConstant: 28),
                dayLabel.topAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.topAnchor),
                dayLabel.centerXAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.centerXAnchor),
                dayLabel.bottomAnchor.constraint(equalTo: dayLabelWrapperView.safeAreaLayoutGuide.bottomAnchor),
            ])
            
            dayStackView.addArrangedSubview(dayLabelWrapperView)
        }
        
        dayStackViewContainerView.addSubview(dayStackView)
    }
    
}

