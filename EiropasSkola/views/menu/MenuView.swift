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
    
    // MARK: - Private variables
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "CloseIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Public variables
    
    public let tableView: UITableView = {
        let table = UITableView()
        table.register(NavigationTableViewCell.self, forCellReuseIdentifier: NavigationTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    public weak var delegate: MenuViewDelegate?
    
    
    // MARK: - Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.insertSublayer(CustomGradientLayer.pageGradientLayer(bounds: self.bounds), at: 0)
        
        addSubviews(closeButton, tableView)
        
        closeButton.addTarget(self, action: #selector(didTapCloseMenuButton) , for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overriden functions
    
    override func layoutSubviews() {
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clear
        
        addConstraints()
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 25),
            closeButton.widthAnchor.constraint(equalToConstant: 25),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: closeButton.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    // MARK: - Objective C functions
    
    @objc func didTapCloseMenuButton() {
        delegate?.didTapCloseMenuButton()
    }
    
}

