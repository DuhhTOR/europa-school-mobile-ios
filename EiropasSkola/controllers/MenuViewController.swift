//
//  MenuViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


protocol MenuViewControllerDelegate: AnyObject {
    func didTapCloseMenuButton()
}


class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    
    private let closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "CloseIcon"), for: .normal)
        
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NavigationTableViewCell.self, forCellReuseIdentifier: NavigationTableViewCell.identifier)
        table.backgroundView = nil
        table.backgroundColor = UIColor.clear
        
        return table
    }()
    
    
    // MARK: lifecyle func
    override func viewDidLoad() {
        view.addSubview(closeButton)
        view.addSubview(tableView)
        
        closeButton.addTarget(self, action: #selector(didTapCloseMenuButton) , for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addConstraints()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layer.insertSublayer(setGradientBackground(), at: 0)
    }
    
    
    // MARK: private function
    private func addConstraints() {
        [closeButton, tableView].forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: closeButton.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
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
        gradientLayer.frame = view.bounds

       return gradientLayer
    }
    
    
    // MARK: actions
    @objc func didTapCloseMenuButton() {
        delegate?.didTapCloseMenuButton()
    }
    
}


// MARK: UITableViewDataSource and UITableViewDelegate extension
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuItems.count
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
            text: MenuItems[indexPath.row].text,
            icon: MenuItems[indexPath.row].icon
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

