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


public let MenuItems = [
    MenuItem(text: "Plānotājs", icon: UIImage(named: "StarIcon")),
    MenuItem(text: "Process", icon: UIImage(named: "LayersIcon")),
    MenuItem(text: "Priekšmeti", icon: UIImage(named: "BookIcon.Open")),
    MenuItem(text: "Pārbaudes darbi", icon: UIImage(named: "FlagIcon")),
    MenuItem(text: "Sasniegumi", icon: UIImage(named: "AwardIcon")),
    MenuItem(text: "Maksājumi", icon: UIImage(named: "ShoppingBagIcon")),
    MenuItem(text: "Eksāmeni", icon: UIImage(named: "FlashIcon")),
]

