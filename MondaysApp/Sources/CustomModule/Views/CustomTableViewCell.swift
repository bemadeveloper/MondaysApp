//
//  CustomTableViewCell.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    var data: Model? {
        didSet {
            guard let data else { return }
            iconView.data = data
            titleLabel.text = data.type.rawValue
            configureTrailingView()
        }
    }
    
    // MARK: Outlets
    
    private lazy var iconView = SettingImageView(frame: .zero)
    
    private lazy var titleLabel = UILabel()
    
    private var trailingView: UIView?
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Self.identifier)
        setupView()
        setupHierarchy()
        setupLayout()
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
        [iconView, titleLabel].forEach { addSubview($0) }
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(Constants.imageLeadingOffset)
            make.centerY.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(Constants.textLeadingOffset)
            make.centerY.equalTo(contentView)
        }
    }
    
    // MARK: TrailingView configuration
    
    private func configureTrailingView() {
        accessoryType = .disclosureIndicator
        guard let settingKind = data?.kind else {
            return
        }
        
        let trailingViewTrailingOffset: Double
        switch settingKind {
        case .connectionInfo(value: let value):
            configureConnectionInfo(connectionInfo: value)
            trailingViewTrailingOffset = Constants.trailingViewTrailingOffset
        case .notification(count: let count):
            configureNotification(count: count)
            trailingViewTrailingOffset = Constants.trailingViewTrailingOffset
        }
        addTrailingViewToHierarchy()
        setupTrailingViewLayout(trailingViewTrailingOffset: trailingViewTrailingOffset)
    }
        
        private func addTrailingViewToHierarchy() {
            if let trailingView {
                addSubview(trailingView)
            }
        }
        
        private func setupTrailingViewLayout(trailingViewTrailingOffset: Double) {
            if let trailingView {
                trailingView.snp.makeConstraints { make in
                    make.trailing.equalTo(contentView).offset(-trailingViewTrailingOffset)
                    make.centerY.equalTo(contentView)
                }
            }
        }
        
        private func configureConnectionInfo(connectionInfo: ConnectionInfo) {
            let label = UILabel()
            label.text = connectionInfo.description
            label.font = Constants.trailingLabelTextFont
            label.textColor = Constants.trailingLabelTextColor
            trailingView = label
        }
        
        private func configureNotification(count: Int) {
            let label = UILabel()
            label.text = "\(count)"
            label.textAlignment = .center
            label.textColor = Constants.trailingNotificationsTextColor
            label.font = Constants.trailingNotificationsTextFont
            label.layer.backgroundColor = Constants.trailingNotificationsColor.cgColor
            label.layer.cornerRadius = Constants.trailingNotificationsCornerRadius
            label.layer.masksToBounds = true
            trailingView = label
            if let trailingView {
                trailingView.snp.makeConstraints { make in
                    make.height.width.equalTo(Constants.trailingNotificationsSize)
                }
            }
        }
        
        // MARK: - Reuse
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
            trailingView = nil
            accessoryType = .none
            accessoryView = nil
        }
    }
    
    // MARK: - Constants
    
fileprivate enum Constants {
    static let backgroundColor = UIColor.white
    static let textFont = UIFont.systemFont(ofSize: 16)
    static let textColor = UIColor.black
    static let textLeadingOffset = 15.0
    static let imageLeadingOffset = 10.0
    static let imageVerticalOffset = 6.0
    static let trailingViewTrailingOffset = 8.0
    static let trailingLabelTextFont = UIFont.systemFont(ofSize: 16)
    static let trailingLabelTextColor = UIColor.systemGray
    static let trailingNotificationsColor = UIColor.systemRed
    static let trailingNotificationsSize = 20.0
    static let trailingNotificationsCornerRadius = trailingNotificationsSize / 2
    static let trailingNotificationsTextColor = UIColor.white
    static let trailingNotificationsTextFont = UIFont.systemFont(ofSize: 12)
}

enum SettingsTableViewCellConstants {
    static let imageSize = 30.0
    static let separatorInsetLeft = Constants.imageLeadingOffset + Self.imageSize + Constants.textLeadingOffset
    static let rowHeight = Self.imageSize + Constants.imageVerticalOffset * 2
}
