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
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 16)
        label.textColor = UIColor(red: 0.984, green: 0.949, blue: 0.894, alpha: 1)
        label.attributedText = NSMutableAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let currentDateLabel: UILabel = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 16)
        label.textColor = UIColor(red: 0.984, green: 0.949, blue: 0.894, alpha: 1)
        label.attributedText = NSMutableAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private enum customDateFormats: String {
        case timeOnly = "HH:mm"
        case dateOnly = "dd. MMMM"
    }
    private static let dateFormatter: DateFormatter = DateFormatter()
    private static var timer: Timer?
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(clockIconImageView, currentTimeLabel, calendarIconImageView, currentDateLabel)
        
        currentTimeLabel.text = getCurrentTime()
        currentDateLabel.text = getCurrentDate()
        Self.timer = Timer.scheduledTimer(
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
            clockIconImageView.widthAnchor.constraint(equalToConstant: 24),
            clockIconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            currentTimeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            currentTimeLabel.leadingAnchor.constraint(equalTo: clockIconImageView.trailingAnchor, constant: 15),
            currentTimeLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),

            calendarIconImageView.widthAnchor.constraint(equalToConstant: 24),
            calendarIconImageView.heightAnchor.constraint(equalToConstant: 24),
            calendarIconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            calendarIconImageView.leadingAnchor.constraint(equalTo: currentTimeLabel.trailingAnchor, constant: 27),

            currentDateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            currentDateLabel.leadingAnchor.constraint(equalTo: calendarIconImageView.trailingAnchor, constant: 15),
            currentDateLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    
    private func getCurrentTime() -> String {
        Self.dateFormatter.dateFormat = customDateFormats.timeOnly.rawValue
        
        return Self.dateFormatter.string(from: Date())
    }
    
    
    private func getCurrentDate() -> String {
        Self.dateFormatter.dateFormat = customDateFormats.dateOnly.rawValue
        
        return Self.dateFormatter.string(from: Date())
    }
    
    
    // MARK: - Objective C functions
    
    @objc func tick() {
        currentTimeLabel.text = getCurrentTime()
        currentDateLabel.text = getCurrentDate()
    }
    
}

