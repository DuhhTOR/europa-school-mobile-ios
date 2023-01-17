//
//  TableViewCell.swift
//  EiropasSkola
//
//  Created by Ervins on 22/12/2022.
//

import UIKit


class NavigationTableViewCell: UITableViewCell {
    
    // MARK: - Public static variables
    
    public static let identifier = "NavigationTableViewCell"
    
    // MARK: - Private variables
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let titleLabel: UILabel = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 16)
        label.textColor = UIColor(red: 0.922, green: 0.929, blue: 0.937, alpha: 1)
        label.attributedText = NSMutableAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let secondaryNavIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ChevronIcon.Right")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    // MARK: - Initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubviews(iconImageView, titleLabel, secondaryNavIconImageView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    
    // MARK: - Overriden functions
    
    override func layoutSubviews() {
        addConstraints()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        titleLabel.text = nil
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: secondaryNavIconImageView.safeAreaLayoutGuide.leadingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            secondaryNavIconImageView.widthAnchor.constraint(equalToConstant: 24),
            secondaryNavIconImageView.heightAnchor.constraint(equalToConstant: 24),
            secondaryNavIconImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondaryNavIconImageView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    
    // MARK: - Public functions
    
    public func configure(with menuItem: MenuItem) {
        iconImageView.image = menuItem.icon
        titleLabel.text = menuItem.name
    }

}

