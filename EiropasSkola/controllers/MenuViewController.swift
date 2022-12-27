//
//  MenuViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


class MenuViewController: UIViewController {
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layer.insertSublayer(setGradientBackground(), at: 0)
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
    
}

