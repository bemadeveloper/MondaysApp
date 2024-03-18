//
//  BestTeamViewController.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit
import SnapKit

class BestTeamViewController: UIViewController, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellOfSettings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellOfSettings?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.cellOfSetting = cellOfSettings?[indexPath.section][indexPath.row]
        //cell?.accessoryType = .detailDisclosureButton
        return cell ?? UITableViewCell()
    }
    
    
    private var cellOfSettings: [[CellOfSettings]]?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellOfSettings = CellOfSettings.settings
        view.backgroundColor = .systemCyan
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }

}
