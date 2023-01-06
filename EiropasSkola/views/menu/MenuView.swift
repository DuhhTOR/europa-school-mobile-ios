//
//  NavigationView.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import UIKit


protocol MenuViewDelegate: AnyObject {
    func didTapCloseMenuButton()
}


class MenuView: UIView {
    
    private let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "CloseIcon"), for: .normal)
        
        return button
    }()

    public let tableView: UITableView = {
        let table = UITableView()
        table.register(NavigationTableViewCell.self, forCellReuseIdentifier: NavigationTableViewCell.identifier)
        
        return table
    }()
    
    public weak var delegate: MenuViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.insertSublayer(setGradientBackground(), at: 0)
        
        addSubview(closeButton)
        addSubview(tableView)
        
        closeButton.addTarget(self, action: #selector(didTapCloseMenuButton) , for: .touchUpInside)
    }
    
    
    override func layoutSubviews() {
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clear
        
        addConstraints()
    }
    
    
    private func addConstraints() {
        let subviews = [closeButton, tableView]
        
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: closeButton.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func setGradientBackground() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.047, green: 0.137, blue: 0.251, alpha: 1).cgColor,
            UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.bounds

       return gradientLayer
    }
    
    
    @objc func didTapCloseMenuButton() {
        delegate?.didTapCloseMenuButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

