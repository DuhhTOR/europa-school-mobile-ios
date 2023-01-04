//
//  HomeViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


protocol HomeViewControllerDelegate: AnyObject {
    func didTapOpenMenuButton()
}


class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapOpenMenuButton)
        )
    }
    
    
    @objc func didTapOpenMenuButton() {
        delegate?.didTapOpenMenuButton()
    }
}
