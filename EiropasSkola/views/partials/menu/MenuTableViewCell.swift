//
//  TableViewCell.swift
//  EiropasSkola
//
//  Created by Ervins on 22/12/2022.
//

import UIKit


class NavigationTableViewCell: UITableViewCell {
    
    public static let identifier = "NavigationTableViewCell"
    
    private let itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 16)
        label.textColor = UIColor(red: 0.922, green: 0.929, blue: 0.937, alpha: 1)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    private let secondaryNavIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ChevronIcon.Right")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        contentView.addSubview(itemIcon)
        contentView.addSubview(itemLabel)
        contentView.addSubview(secondaryNavIcon)
        
        addConstraints()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        itemIcon.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        itemLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: itemIcon.frame.size.width - 20 - secondaryNavIcon.frame.size.width - 20,
            height: contentView.frame.size.height
        )
        secondaryNavIcon.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemIcon.image = nil
        itemLabel.text = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    
    private func addConstraints() {
        let subviews = [itemIcon, itemLabel, secondaryNavIcon]
        
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            itemIcon.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            itemIcon.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            itemLabel.leadingAnchor.constraint(equalTo: itemIcon.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            itemLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            secondaryNavIcon.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondaryNavIcon.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    public func configure(text: String, icon: UIImage?) {
        itemIcon.image = icon
        itemLabel.text = text
    }

}

