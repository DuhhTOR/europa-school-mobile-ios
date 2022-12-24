//
//  NavigationItems.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import Foundation
import UIKit


public struct NavigationItem {
    var text: String
    var icon: UIImage?
}


public let NavigationItems = [
    NavigationItem(text: "Plānotājs", icon: UIImage(named: "StarIcon")),
    NavigationItem(text: "Process", icon: UIImage(named: "LayersIcon")),
    NavigationItem(text: "Priekšmeti", icon: UIImage(named: "BookIcon.Open")),
    NavigationItem(text: "Pārbaudes darbi", icon: UIImage(named: "FlagIcon")),
    NavigationItem(text: "Sasniegumi", icon: UIImage(named: "AwardIcon")),
    NavigationItem(text: "Maksājumi", icon: UIImage(named: "ShoppingBagIcon")),
    NavigationItem(text: "Eksāmeni", icon: UIImage(named: "FlashIcon")),
]
