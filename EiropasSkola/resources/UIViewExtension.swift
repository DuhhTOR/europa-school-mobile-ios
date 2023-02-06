//
//  UIViewExtension.swift
//  EiropasSkola
//
//  Created by Ervins on 17/01/2023.
//

import UIKit


extension UIView {
    
    // MARK: - Public functions
    
    public func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
    
}

