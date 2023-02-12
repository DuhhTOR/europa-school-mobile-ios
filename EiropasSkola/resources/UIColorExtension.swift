//
//  UIColorExtension.swift
//  EiropasSkola
//
//  Created by Ervins on 06/02/2023.
//

import UIKit


extension UIColor {
    
    public struct calendarColors {
        
        public struct label {
            
            public static let normal = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1)
            public static let weekend = UIColor(red: 0.522, green: 0.573, blue: 0.62, alpha: 1)
            public static let outDate = UIColor(red: 0.522, green: 0.573, blue: 0.62, alpha: 1)
            public static let holiday = UIColor(red: 0.855, green: 0.118, blue: 0.157, alpha: 1)
            public static let today = UIColor(red: 0.047, green: 0.137, blue: 0.251, alpha: 1)
            
        }
        public struct cell {
            
            public static let today = UIColor(red: 0.992, green: 0.992, blue: 0.992, alpha: 1)
            public static let firstDayOfWeek = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
            
        }
        
    }
    
}

