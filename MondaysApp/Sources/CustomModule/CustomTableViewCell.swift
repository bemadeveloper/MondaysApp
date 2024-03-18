//
//  CustomTableViewCell.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    var cellOfSetting: CellOfSettings? {
        didSet {
            icon.image = cellOfSetting?.icon.image
            name.text = cellOfSetting?.nameOfSettings.rawValue
            chevron.image = cellOfSetting?.chevron
        }
    }

    // MARK: - Outlets
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let chevron: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 9
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(chevron)
        addSubview(stack)
        
    }
    
    private func setupLayout() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        chevron.translatesAutoresizingMaskIntoConstraints = false
        
        stack.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            }
        // Установка констрейнтов для изображения
        icon.snp.makeConstraints { make in
                make.width.equalTo(20) // Ширина изображения
                make.height.equalTo(icon.snp.width) // Высота изображения равна его ширине
            }
        
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.cellOfSetting = nil
    }
}
