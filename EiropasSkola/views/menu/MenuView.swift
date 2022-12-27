//
//  NavigationView.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import UIKit


class MenuView: UIView {

    private let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "CloseIcon"), for: .normal)
        
        return button
    }()
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NavigationTableViewCell.self, forCellReuseIdentifier: NavigationTableViewCell.identifier)
        
        return table
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(closeButton)
        addSubview(tableView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}


extension MenuView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NavigationItems.count
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NavigationTableViewCell.identifier,
            for: indexPath
        ) as? NavigationTableViewCell else { return UITableViewCell() }
        cell.configure(
            text: NavigationItems[indexPath.row].text,
            icon: NavigationItems[indexPath.row].icon
        )

        return cell
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.rowHeight = UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

