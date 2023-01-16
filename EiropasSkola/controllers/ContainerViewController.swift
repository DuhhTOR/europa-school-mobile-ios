//
//  ViewController.swift
//  EiropasSkola
//
//  Created by Ervīns on 28/11/2022.
//

import UIKit


class ContainerViewController: UIViewController {
    
    // MARK: - Private variables
    
    private var menuState: MenuState = .closed
    private let menuViewController = MenuViewController()
    private let homeViewController = HomeViewController()
    private var navigationViewController: UINavigationController?

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVCs()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    
    // MARK: - Private functions
    
    private func addChildVCs() {
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        menuViewController.menuView.delegate = self
        
        homeViewController.delegate = self
        
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        setNavigationBarGradient(for: navigationViewController)
        setNavigationBarShadow(for: navigationViewController)
        
        addChild(navigationViewController)
        view.addSubview(navigationViewController.view)
        navigationViewController.didMove(toParent: self)
        self.navigationViewController = navigationViewController
    }
    
    
    private func setNavigationBarGradient(for navigationViewController: UINavigationController) {
        let gradientLayer = CAGradientLayer()
        var updatedFrame = navigationViewController.navigationBar.bounds
        updatedFrame.size.height += view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [
            UIColor(red: 0.05, green: 0.14, blue: 0.25, alpha: 1).cgColor,
            UIColor(red: 0.2, green: 0.29, blue: 0.37, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0, 1]
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        navigationViewController.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)

        let appearance = navigationViewController.navigationBar.standardAppearance.copy()
        appearance.backgroundImage = image
        
        navigationViewController.navigationBar.standardAppearance = appearance
        navigationViewController.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    private func setNavigationBarShadow(for navigationViewController: UINavigationController) {
        navigationViewController.navigationBar.layer.masksToBounds = false
        navigationViewController.navigationBar.layer.shadowColor = UIColor(
            red: 0.047,
            green: 0.137,
            blue: 0.251,
            alpha: 0.5
        ).cgColor
        navigationViewController.navigationBar.layer.shadowOpacity = 1
        navigationViewController.navigationBar.layer.shadowRadius = 8
        navigationViewController.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}


extension ContainerViewController: HomeViewControllerDelegate, MenuViewDelegate {
    
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
            self.navigationViewController?.view.frame.origin.x = self.homeViewController.view.frame.size.width
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
            self.navigationViewController?.view.frame.origin.x = 0
        } completion: { [weak self] done in
            if done {
                self?.menuState = .closed
            }
        }
    }
    
}

