//
//  TableViewCell.swift
//  EiropasSkola
//
//  Created by Ervins on 22/12/2022.
//

import UIKit


class NavigationTableViewCell: UITableViewCell {
    
    public static let identifier = "NavigationTableViewCell"
    
    public let itemIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    public let itemLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    public let secondaryNavIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addConstraints()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        itemIcon.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        itemLabel.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        secondaryNavIcon.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    
    func addConstraints() {
        let subviews = [itemIcon, itemLabel, secondaryNavIcon]
        
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            itemIcon.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            itemIcon.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            itemIcon.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            itemLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: itemIcon.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            secondaryNavIcon.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            secondaryNavIcon.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondaryNavIcon.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }

}

