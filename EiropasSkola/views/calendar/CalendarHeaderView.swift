//
//  CalendarHeaderView.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit


class CalendarHeaderView: UIView {
    
    // MARK: - Private variables

    private let clockIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ClockIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let calendarIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CalendarIcon.Darker.Outlined")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let currentDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private enum customDateFormats: String {
        case timeOnly = "HH:mm"
        case dateOnly = "dd. MMMM"
    }
    private let dateFormatter: DateFormatter = DateFormatter()
    private var timer: Timer = Timer()
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(clockIconImageView, currentTimeLabel, calendarIconImageView, currentDateLabel)
        
        currentTimeLabel.text = getCurrentTime()
        currentDateLabel.text = getCurrentDate()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector:#selector(self.tick),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overriden functions
    
    override func layoutSubviews() {
        addConstraints()
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            clockIconImageView.widthAnchor.constraint(equalToConstant: 20),
            clockIconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            currentTimeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            currentTimeLabel.leadingAnchor.constraint(equalTo: clockIconImageView.trailingAnchor, constant: 15),

            calendarIconImageView.widthAnchor.constraint(equalToConstant: 20),
            calendarIconImageView.heightAnchor.constraint(equalToConstant: 20),
            calendarIconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            calendarIconImageView.leadingAnchor.constraint(equalTo: currentTimeLabel.trailingAnchor, constant: 27),

            currentDateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            currentDateLabel.leadingAnchor.constraint(equalTo: calendarIconImageView.trailingAnchor, constant: 15),
        ])
    }
    
    
    private func getCurrentTime() -> String {
        dateFormatter.dateFormat = customDateFormats.timeOnly.rawValue
        
        return dateFormatter.string(from: Date())
    }
    
    
    private func getCurrentDate() -> String {
        dateFormatter.dateFormat = customDateFormats.dateOnly.rawValue
        
        return dateFormatter.string(from: Date())
    }
    
    
    // MARK: - Objective C functions
    
    @objc func tick() {
        currentTimeLabel.text = getCurrentTime()
        currentDateLabel.text = getCurrentDate()
    }
    
}

