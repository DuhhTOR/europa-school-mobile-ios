//
//  NavigationItems.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import Foundation
import UIKit


public struct MenuItem {
    let text: String
    let icon: UIImage?
}


public let MenuItems: [MenuItem] = [
    .init(text: "Plānotājs", icon: UIImage(named: "StarIcon")),
    .init(text: "Process", icon: UIImage(named: "LayersIcon")),
    .init(text: "Priekšmeti", icon: UIImage(named: "BookIcon.Open")),
    .init(text: "Pārbaudes darbi", icon: UIImage(named: "FlagIcon")),
    .init(text: "Sasniegumi", icon: UIImage(named: "AwardIcon")),
    .init(text: "Maksājumi", icon: UIImage(named: "ShoppingBagIcon")),
    .init(text: "Eksāmeni", icon: UIImage(named: "FlashIcon")),
]

