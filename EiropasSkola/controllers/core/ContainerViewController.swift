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
    private lazy var plannerViewController = PlannerViewController()
    private lazy var processViewController = ProcessViewController()
    private lazy var subjectsViewController = SubjectsViewController()
    private lazy var testsViewController = TestsViewController()
    private lazy var achievementsViewController = AchievementsViewController()
    private lazy var paymentsViewController = PaymentsViewController()
    private lazy var examsViewController = ExamsViewController()
    private var currentViewController: UIViewController?

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    // MARK: - Overridden properties

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    
    // MARK: - Private functions
    
    private func addChildViewControllers() {
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        menuViewController.menuView.delegate = self
        menuViewController.delegate = self
        
        homeViewController.delegate = self
        
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        setNavigationBarGradient(for: navigationViewController)
        setNavigationBarShadow(for: navigationViewController)
        
        addChild(navigationViewController)
        view.addSubview(navigationViewController.view)
        navigationViewController.didMove(toParent: self)
        self.navigationViewController = navigationViewController
        
        self.currentViewController = homeViewController
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
    
    internal func didTapOpenMenuButton() {
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
    
    
    internal func didTapCloseMenuButton() {
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
    
    
    internal func didTapCalendarButton() {
        return
    }
    
    
    internal func didTapBookmarkButton() {
        return
    }
    
    
    internal func didTapUserProfileButton() {
        return
    }
    
}


extension ContainerViewController: MenuViewControllerDelegate {
    
    internal func didSelect(menuItem: MenuItem) {
        switch menuItem.type {
            case .home:
                resetHomeViewController()
                didTapCloseMenuButton()
                break
                
            case .planner:
                changeViewController(viewController: plannerViewController)
                break
                
            case .process:
                changeViewController(viewController: processViewController)
                break
                 
            case .subjects:
                changeViewController(viewController: subjectsViewController)
                break
                
            case .tests:
                changeViewController(viewController: testsViewController)
                break
                
            case .achievements:
                changeViewController(viewController: achievementsViewController)
                break
                
            case .payments:
                changeViewController(viewController: paymentsViewController)
                break
                
            case .exams:
                changeViewController(viewController: examsViewController)
                break
        }
    }
    
    
    private func changeViewController(viewController: UIViewController) {
        resetHomeViewController()
        addViewController(viewController: viewController)
        didTapCloseMenuButton()
    }
    
    
    private func addViewController(viewController: UIViewController) {
        homeViewController.addChild(viewController)
        homeViewController.view.addSubview(viewController.view)
        viewController.view.frame = view.frame
        viewController.didMove(toParent: homeViewController)
        
        currentViewController = viewController
    }
    
    
    private func resetHomeViewController() {
        guard currentViewController != homeViewController else {
            didTapCloseMenuButton()
            
            return
        }
        
        currentViewController?.view.removeFromSuperview()
        currentViewController?.didMove(toParent: nil)
    }
    
}

