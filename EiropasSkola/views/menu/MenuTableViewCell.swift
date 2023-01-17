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
    
    private let itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let itemLabel: UILabel = {
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
    private let secondaryNavIcon: UIImageView = {
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
        
        contentView.addSubview(itemIcon)
        contentView.addSubview(itemLabel)
        contentView.addSubview(secondaryNavIcon)
        
        addConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    
    // MARK: - Overriden functions
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemIcon.image = nil
        itemLabel.text = nil
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            itemIcon.widthAnchor.constraint(equalToConstant: 24),
            itemIcon.heightAnchor.constraint(equalToConstant: 24),
            itemIcon.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            itemIcon.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            itemLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: itemIcon.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            itemLabel.trailingAnchor.constraint(equalTo: secondaryNavIcon.safeAreaLayoutGuide.leadingAnchor, constant: -20),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            secondaryNavIcon.widthAnchor.constraint(equalToConstant: 24),
            secondaryNavIcon.heightAnchor.constraint(equalToConstant: 24),
            secondaryNavIcon.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondaryNavIcon.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    
    // MARK: - Public functions
    
    public func configure(with menuItem: MenuItem) {
        itemIcon.image = menuItem.icon
        itemLabel.text = menuItem.name
    }

}

