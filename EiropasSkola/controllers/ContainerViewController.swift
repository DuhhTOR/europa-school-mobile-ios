//
//  ViewController.swift
//  EiropasSkola
//
//  Created by Ervīns on 28/11/2022.
//

import UIKit


class ContainerViewController: UIViewController {
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVCs()
    }


    private func addChildVCs() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        
        homeVC.delegate = self
        
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}


extension ContainerViewController: HomeViewControllerDelegate, MenuViewControllerDelegate {
    
    func didTapOpenMenuButton() {
        guard menuState == .closed else {
            return
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut
        ) {
            self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width
        } completion: { [weak self] done in
            if done {
                self?.menuState = .opened
            }
        }
    }
    
    
    func didTapCloseMenuButton() {
        guard menuState == .opened else {
            return
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut
        ) {
            self.navVC?.view.frame.origin.x = 0
        } completion: { [weak self] done in
            if done {
                self?.menuState = .closed
            }
        }
    }
    
}

