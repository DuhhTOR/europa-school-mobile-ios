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
    
    // MARK: - Public variables
    
    public let calendarCollectionView: JTACMonthView = {
        let calendarCollectionView = JTACMonthView()
        calendarCollectionView.minimumLineSpacing = 0
        calendarCollectionView.minimumInteritemSpacing = 0
        calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        calendarCollectionView.register(CalendarCellView.self, forCellWithReuseIdentifier: CalendarCellView.identifier)
        
        return calendarCollectionView
    }()
    
    
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.insertSublayer(CustomGradientLayer.pageGradientLayer(bounds: self.bounds), at: 0)
        
        addSubviews(calendarHeaderView, calendarCollectionView)
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
            
            calendarCollectionView.topAnchor.constraint(equalTo: calendarHeaderView.safeAreaLayoutGuide.bottomAnchor),
            calendarCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            calendarCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            calendarCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

