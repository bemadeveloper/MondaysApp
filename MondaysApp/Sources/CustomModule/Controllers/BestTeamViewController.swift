//
//  BestTeamViewController.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit
import SnapKit


class BestTeamViewController: UIViewController {
    private var settings: [[Model]] = SettingsGrouped.createGroupedSettings()
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.separatorInset.left = SettingsTableViewCellConstants.separatorInsetLeft
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        fetchData()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
    
    // MARK: Data
    
    private func fetchData() {
        settings = SettingsGrouped.createGroupedSettings()
    }
}

extension BestTeamViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.data = settings[indexPath.section][indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = settings[indexPath.section][indexPath.row]
        print("Нажата ячейка \(data.type.rawValue)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let button = data.kind {
            switch button {
            case .switcher(_) :
                break
            default:
                let detailWindow = BestTeamViewController()
                navigationController?.pushViewController(detailWindow, animated: true)
            }
        }
        }
    }



