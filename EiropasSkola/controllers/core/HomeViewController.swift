//
//  HomeViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


protocol HomeViewControllerDelegate: AnyObject {
    
    func didTapOpenMenuButton()
    
    
    func didTapCalendarButton()
    
    
    func didTapBookmarkButton()
    
    
    func didTapUserProfileButton()
    
}


class HomeViewController: UIViewController {
    
    // MARK: - Public variables
    
    public weak var delegate: HomeViewControllerDelegate?
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let burgerMenuButton: UIBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "BurgerMenuIcon")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(didTapOpenMenuButton)
        )
        let calendarButton: UIBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "CalendarIcon.Darker")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        let bookmarkButton: UIBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "BookmarkIcon")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        let messageButton: UIBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "MessageIcon")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        let userProfileButton: UIBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "UserPictureIcon")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        let spacing: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 20
        
        navigationItem.leftBarButtonItem = burgerMenuButton
        navigationItem.rightBarButtonItems = [
            userProfileButton,
            spacing,
            messageButton,
            spacing,
            bookmarkButton,
            spacing,
            calendarButton,
        ]
    }
    
    
    // MARK: - Objective C functions
    
    @objc func didTapOpenMenuButton() {
        delegate?.didTapOpenMenuButton()
    }
    
    
    @objc func didTapCalendarButton() {
        delegate?.didTapCalendarButton()
    }
    
    
    @objc func didTapBookmarkButton() {
        delegate?.didTapBookmarkButton()
    }
    
    
    @objc func didTapUserProfileButton() {
        delegate?.didTapUserProfileButton()
    }
    
}
