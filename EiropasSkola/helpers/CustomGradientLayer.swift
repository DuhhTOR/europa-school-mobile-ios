//
//  GradientBackground.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//


import UIKit


public struct CustomGradientLayer {
    
    public static let pageGradientColors: [CGColor] = [
        UIColor(red: 0.047, green: 0.137, blue: 0.251, alpha: 1).cgColor,
        UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1).cgColor,
    ]
    
    // MARK: - Public functions
    
    public static func pageGradientLayer(bounds: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = Self.pageGradientColors
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

       return gradientLayer
    }
    
}

