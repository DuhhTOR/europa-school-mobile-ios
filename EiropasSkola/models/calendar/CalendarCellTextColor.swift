//
//  CalendarCellTextColor.swift
//  EiropasSkola
//
//  Created by Ervins on 06/02/2023.
//

import Foundation
import UIKit


enum CalendarCellTextColor: UIColor {
    case normal
    case weekend
    case outDate
    case holiday
}


extension CalendarCellTextColor: RawRepresentable {
    
    typealias RawValue = UIColor
    
    
    init?(rawValue: RawValue) {
        switch rawValue {
            case normal(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1): self = .red
            case weekend(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1): self = .purple
            case outDate(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1): self = .green
            case holiday(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1): self = .green
            default: return nil
        }
    }
    
    
    var rawValue: RawValue {
        switch self {
            case .normal: return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            case .weekend: return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            case .outDate: return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            case .holiday: return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
    
}

