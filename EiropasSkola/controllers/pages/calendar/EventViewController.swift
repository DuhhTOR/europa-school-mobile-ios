//
//  EventViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 04/03/2023.
//

import UIKit


class EventViewController: UIViewController {
    
    // MARK: - Private variables
    
    private let modalCloseButton: UIButton = {
        let modalCloseButton = UIButton()
        modalCloseButton.setImage(UIImage(named: "CloseIcon"), for: .normal)
        modalCloseButton.translatesAutoresizingMaskIntoConstraints = false
        
        return modalCloseButton
    }()
    private let eventTableView: UITableView = {
        let eventTableView = UITableView()
        
        return eventTableView
    }()
    
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.insertSublayer(CustomGradientLayer.pageGradientLayer(bounds: view.bounds), at: 0)
        view.addSubview(modalCloseButton)
        
        modalCloseButton.addTarget(self, action: #selector(didTapCloseModalButton), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        addConstraints()
    }
    
    
    // MARK: - Private functions
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            modalCloseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            modalCloseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            modalCloseButton.widthAnchor.constraint(equalToConstant: 50),
            modalCloseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    // MARK: - ObjectiveC functions
    
    @objc private func didTapCloseModalButton() {
        self.dismiss(animated: true)
    }

}

