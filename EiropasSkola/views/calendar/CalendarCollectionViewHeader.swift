//
//  CalendarCollectionViewHeader.swift
//  EiropasSkola
//
//  Created by Ervins on 16/02/2023.
//

import UIKit


protocol CalendarCollectionViewHeaderDelegate: AnyObject {
    
    func didTapPreviousMonthButton()

    
    func didTapNextMonthButton()
    
}


class CalendarCollectionViewHeader: UIView {

    // MARK: - Private variables
    
    private let previousMonthButton: UIButton = {
        let previousMonthButton = UIButton()
        previousMonthButton.setImage(UIImage(named: "ChevronIcon.Left.Light"), for: .normal)
        previousMonthButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        previousMonthButton.translatesAutoresizingMaskIntoConstraints = false
        
        return previousMonthButton
    }()
    private let nextMonthButton: UIButton = {
        let nextMonthButton = UIButton()
        nextMonthButton.setImage(UIImage(named: "ChevronIcon.Right.Light"), for: .normal)
        nextMonthButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
        
        return nextMonthButton
    }()
    private let currentSelectedMonthLabel: UILabel = {
        let paragraphStyle = NSMutableParagraphStyle()
        let currentSelectedMonthLabel = UILabel()
        currentSelectedMonthLabel.baselineAdjustment = .alignCenters
        currentSelectedMonthLabel.textAlignment = .center
        currentSelectedMonthLabel.textColor = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1)
        currentSelectedMonthLabel.font = UIFont(name: "IBMPlexSans-Medium", size: 24)
        currentSelectedMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return currentSelectedMonthLabel
    }()
    
    // MARK: - Public variables
    public weak var delegate: CalendarCollectionViewHeaderDelegate?
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubviews(previousMonthButton, currentSelectedMonthLabel, nextMonthButton)
        
        previousMonthButton.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
        nextMonthButton.addTarget(self, action: #selector(didTapNextMonthButton), for: .touchUpInside)
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
            previousMonthButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            previousMonthButton.trailingAnchor.constraint(equalTo: currentSelectedMonthLabel.safeAreaLayoutGuide.leadingAnchor, constant: -15),
            
            currentSelectedMonthLabel.widthAnchor.constraint(equalToConstant: 150),
            currentSelectedMonthLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            currentSelectedMonthLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            currentSelectedMonthLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            nextMonthButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            nextMonthButton.leadingAnchor.constraint(equalTo: currentSelectedMonthLabel.safeAreaLayoutGuide.trailingAnchor, constant: 15),
        ])
    }
    
    
    // MARK: - Public functions
    
    public func configureCurrentSelectedMonthLabel(with date: String) {
        currentSelectedMonthLabel.text = date.capitalized
    }
    
    
    // MARK: - Objective C functions
    
    @objc func didTapPreviousMonthButton() {
        delegate?.didTapPreviousMonthButton()
    }
    
    
    @objc func didTapNextMonthButton() {
        delegate?.didTapNextMonthButton()
    }

}
