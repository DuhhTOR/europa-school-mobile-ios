//
//  NavigationItems.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import UIKit


public struct MenuItem {
    
    // MARK: - Public variables
    
    public enum Page: String {
        case planner = "Plānotājs"
        case process = "Process"
        case subjects = "Priekšmeti"
        case tests = "Pārbaudes darbi"
        case achievments = "Sasniegumi"
        case payments = "Maksājumi"
        case exams = "Eksāmeni"
        
        var icon: String {
            switch self {
                case .planner:
                    return "StarIcon"
                case .process:
                    return "LayersIcon"
                case .subjects:
                    return "BookIcon.Open"
                case .tests:
                    return "FlagIcon"
                case .achievments:
                    return "AwardIcon"
                case .payments:
                    return "ShoppingBagIcon"
                case .exams:
                    return "FlashIcon"
            }
        }
    }
    public let type: Page
    public let name: String
    public let icon: UIImage?
    
    
    // MARK: - Initialization
    
    init(type: Page) {
        self.type = type
        self.name = self.type.rawValue
        self.icon = UIImage(named: self.type.icon)
    }
    
}

