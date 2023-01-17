//
//  CalendarView.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit


class CalendarView: UIView {
    
    // MARK: - Private variables
    
    private let calendarHeaderView: CalendarHeaderView = {
        let calendarHeaderView = CalendarHeaderView()
        calendarHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return calendarHeaderView
    }()
    
    
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(calendarHeaderView)
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
            calendarHeaderView.heightAnchor.constraint(equalToConstant: 20),
            calendarHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
            calendarHeaderView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            calendarHeaderView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -18),
        ])
    }
    
}

