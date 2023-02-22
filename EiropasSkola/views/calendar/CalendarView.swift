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
    public let calendarCollectionViewHeader: CalendarCollectionViewHeader = {
        let calendarCollectionViewHeader = CalendarCollectionViewHeader()
        calendarCollectionViewHeader.translatesAutoresizingMaskIntoConstraints = false
        
        return calendarCollectionViewHeader
    }()
    
    // MARK: - Public variables
    
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
        
        addSubviews(calendarHeaderView, calendarCollectionViewHeader, calendarCollectionView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overridden functions
    
    override func layoutSubviews() {
        addConstraints()
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            calendarHeaderView.heightAnchor.constraint(equalToConstant: 24),
            calendarHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            calendarHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            calendarHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            calendarCollectionViewHeader.heightAnchor.constraint(equalToConstant: 40),
            calendarCollectionViewHeader.topAnchor.constraint(equalTo: calendarHeaderView.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            calendarCollectionViewHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            calendarCollectionViewHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            calendarCollectionView.heightAnchor.constraint(equalToConstant: 300),
            calendarCollectionView.topAnchor.constraint(equalTo: calendarCollectionViewHeader.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            calendarCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            calendarCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
}

