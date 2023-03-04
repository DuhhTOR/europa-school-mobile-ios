//
//  NavigationItems.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import UIKit


public struct MenuItem {
    
    // MARK: - Public variables
    
    public enum Pages: String {
        case calendar = "Kalendārs"
        case planner = "Plānotājs"
        case process = "Process"
        case subjects = "Priekšmeti"
        case tests = "Pārbaudes darbi"
        case achievements = "Sasniegumi"
        case payments = "Maksājumi"
        case exams = "Eksāmeni"
        
        var icon: String {
            switch self {
                case .calendar:
                    return "CalendarIcon"
                    
                case .planner:
                    return "StarIcon"
                    
                case .process:
                    return "LayersIcon"
                    
                case .subjects:
                    return "BookIcon.Open"
                    
                case .tests:
                    return "FlagIcon"
                    
                case .achievements:
                    return "AwardIcon"
                    
                case .payments:
                    return "ShoppingBagIcon"
                    
                case .exams:
                    return "FlashIcon"
            }
        }
    }
    public let type: Pages
    public let name: String
    public let icon: UIImage?
    
    
    // MARK: - Initialisation
    
    init(type: Pages) {
        self.type = type
        self.name = self.type.rawValue
        self.icon = UIImage(named: self.type.icon)
    }
    
}

