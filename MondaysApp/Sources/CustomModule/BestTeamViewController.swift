//
//  BestTeamViewController.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit
import SnapKit


class BestTeamViewController: UIViewController {
    private var settings: [[Setting]]?
    
    var appCoordinator: AppCoordinator?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
        fetchData()
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
    
    // MARK: Data

    private func fetchData() {
        settings = SettingsGrouped.createGroupedSettings()
    }
}

extension BestTeamViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            settings?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return settings?[section].count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
            cell?.data = settings?[indexPath.section][indexPath.row]
            //cell?.accessoryType = .detailDisclosureButton
            return cell ?? UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let viewController = DetailViewController()
//            tableView.deselectRow(at: indexPath, animated: true)
//            viewController.data = settings?[indexPath.section][indexPath.row]
            guard let data = settings?[indexPath.section][indexPath.row] else { return }
            print("Нажата ячейка \(data.type.rawValue)")
            tableView.deselectRow(at: indexPath, animated: true)

//            if let accessory = data.kind {
//                switch accessory {
//                case .switcher(_):
//                    break
//                default:
//                    break
//                }
//            }
        }
    }



