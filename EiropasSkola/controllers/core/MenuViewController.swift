//
//  MenuViewController.swift
//  EiropasSkola
//
//  Created by Ervins on 13/12/2022.
//

import UIKit


protocol MenuViewControllerDelegate: AnyObject {
    
    func didSelect(menuItem: MenuItem)
    
}


class MenuViewController: UIViewController {
    
    // MARK: - Private variables
    
    private let menuItems: [MenuItem] = {
       return [
        .init(type: .home),
        .init(type: .calendar),
        .init(type: .planner),
        .init(type: .process),
        .init(type: .subjects),
        .init(type: .tests),
        .init(type: .achievements),
        .init(type: .payments),
        .init(type: .exams),
       ]
    }()
    
    // MARK: - Public variables
    
    public weak var delegate: MenuViewControllerDelegate?
    public let menuView: MenuView = {
        return MenuView(frame: UIScreen.main.bounds)
    }()
    
    
    // MARK: - Lifecycle
    
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
        return menuItems.count
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NavigationTableViewCell.identifier,
            for: indexPath
        ) as? NavigationTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: menuItems[indexPath.row])

        return cell
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.rowHeight = UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.didSelect(menuItem: menuItems[indexPath.row])
    }
}

