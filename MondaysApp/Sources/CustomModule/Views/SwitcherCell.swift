//
//  ConnectionInfoCell.swift
//  MondaysApp
//
//  Created by Bema on 10/4/24.
//

import Foundation
import UIKit

class SwitcherCell: UITableViewCell {
    
    static let identifier = "SwitcherCell"
    
    var data: AirmodeModel? {
        didSet {
            guard let data else { return }
            iconView.data = data
            switchValueChanged(switchControl)
        }
    }
    
    // MARK: - Outlets
    
    private lazy var iconView = SettingImageAirmode(frame: .zero)
    
    private lazy var airplaneLabel: UILabel = {
        let label = UILabel()
        label.text = "Авиарежим"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return switchControl
    }()
    
    var switchAction: ((Bool) -> Void)?
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        switchAction?(sender.isOn)
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupHierarchy()
        setupLayout()
        setupSwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupView() {
        let contentConfiguration = UIListContentConfiguration.valueCell()
        self.contentConfiguration = contentConfiguration
    }
    
    private func setupHierarchy() {
        addSubview(iconView)
        addSubview(airplaneLabel)
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(10.0)
            make.centerY.equalTo(contentView)
        }
        airplaneLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(15.0)
            make.centerY.equalTo(contentView)
        }
    }
    
    private func setupSwitch() {
        accessoryView = switchControl
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        accessoryType = .none
        accessoryView = nil
    }
}

