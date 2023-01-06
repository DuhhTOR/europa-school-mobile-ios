//
//  MenuViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


class MenuViewController: UIViewController {
    
    public let menuView: MenuView = {
        return MenuView(frame: UIScreen.main.bounds)
    }()
    
    
    override func loadView() {
        self.view = menuView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.tableView.delegate = self
        menuView.tableView.dataSource = self
    }
    
}


extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuItems.count
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NavigationTableViewCell.identifier,
            for: indexPath
        ) as? NavigationTableViewCell else { return UITableViewCell() }
        cell.configure(
            text: MenuItems[indexPath.row].text,
            icon: MenuItems[indexPath.row].icon
        )

        return cell
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.rowHeight = UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

