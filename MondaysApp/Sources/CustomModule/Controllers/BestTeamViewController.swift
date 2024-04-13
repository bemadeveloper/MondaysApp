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
    private var airmode: [[AirmodeModel]]?
    
    // MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func loadView() {
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        let view = TableView()
        view.configureTableView(delegate: self, dataSource: self)
        self.view = view
        self.title = "Настройки"
    }
    
    // MARK: Data
    
    private func fetchData() {
        settings = SettingsGrouped.createGroupedSettings()
        airmode = GroupedAirmode.createGroup()
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
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitcherCell.identifier, for: indexPath) as? SwitcherCell
            cell?.data = airmode?[indexPath.section][indexPath.row] as? AirmodeModel
            cell?.switchAction = { isOn in
                print("Switch is \(isOn ? "ON" : "OFF")")
            }
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
            cell?.data = settings[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = settings[indexPath.section][indexPath.row]
        print("Нажата ячейка \(data.type.rawValue)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if let button = data.kind {
            switch button {
            case .notification(count: 0):
                break
            default:
                let detailWindow = DetailViewController(data: data)
                navigationController?.pushViewController(detailWindow, animated: true)
            }
        }
    }
}



