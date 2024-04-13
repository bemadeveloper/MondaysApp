//
//  DetailView.swift
//  MondaysApp
//
//  Created by Bema on 14/4/24.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    var data: Model? {
        didSet {
            configureView()
        }
    }
    
    // MARK: - Outlets

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()

    private lazy var imageView = SettingImageView(frame: .zero)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 10.0
        return stackView
    }()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupView() {
        backgroundColor = UIColor.white
    }

    private func setupHierarchy() {
        [stackView].forEach { addSubview($0) }
    }

    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }

    // MARK: View configuration

    private func configureView() {
        guard let data else { return }
        imageView.data = data
        if let settingKind = data.kind {
            switch settingKind {
            case .connectionInfo(value: let value):
                label.text = value.description
                return
            case .notification(count: let count):
                label.text = "<Новых уведомлений>: \(count)"
                return
            default:
                break
            }
        }
        label.text = "Done"
    }
    
    
}
