//
//  DetailViewController.swift
//  MondaysApp
//
//  Created by Bema on 18/3/24.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: Data

    private let data: Model
    
    // MARK: - Init
    
    init(data: Model) {
            self.data = data
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    // MARK: Lifecycle

    override func loadView() {
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Setup

    private func setupView() {
        let view = DetailView()
        view.data = data
        self.view = view
        title = data.type.rawValue
    }
}
