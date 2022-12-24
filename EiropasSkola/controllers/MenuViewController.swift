//
//  MenuViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NavigationTableViewCell.self, forCellReuseIdentifier: NavigationTableViewCell.identifier)
        
        return table
    }()
    private let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "CloseIcon"), for: .normal)
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(closeButton)
        view.addSubview(tableView)
        
        addConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layer.insertSublayer(setGradientBackground(), at: 0)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.bounds.size.width,
            height: view.bounds.size.height - closeButton.bounds.size.width - 50
        )
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clear
    }
    
    
    private func addConstraints() {
        let subviews = [closeButton, tableView]
        
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = [
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: closeButton.safeAreaLayoutGuide.bottomAnchor, constant: 100),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func setGradientBackground() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.047, green: 0.137, blue: 0.251, alpha: 1).cgColor,
            UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds

       return gradientLayer
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NavigationItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NavigationTableViewCell.identifier,
            for: indexPath
        ) as? NavigationTableViewCell else { return UITableViewCell() }
        cell.configure(
            text: NavigationItems[indexPath.row].text,
            icon: NavigationItems[indexPath.row].icon ?? UIImage()
        )
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
