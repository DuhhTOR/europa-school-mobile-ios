//
//  NavigationItems.swift
//  EiropasSkola
//
//  Created by Ervins on 24/12/2022.
//

import Foundation
import UIKit


public struct NavigationItem {
    var name: String
    var icon: UIImage?
}


public let NavigationItems = [
    NavigationItem(name: "Plānotājs", icon: UIImage(named: "StarIcon")),
    NavigationItem(name: "Process", icon: UIImage(named: "LayersIcon")),
    NavigationItem(name: "Priekšmeti", icon: UIImage(named: "BookIcon.Open")),
    NavigationItem(name: "Pārbaudes darbi", icon: UIImage(named: "FlagIcon")),
    NavigationItem(name: "Sasniegumi", icon: UIImage(named: "AwardIcon")),
    NavigationItem(name: "Maksājumi", icon: UIImage(named: "ShoppingBagIcon")),
    NavigationItem(name: "Eksāmeni", icon: UIImage(named: "FlashIcon")),
]
