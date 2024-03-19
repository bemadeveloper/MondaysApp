//
//  AppCoordinator.swift
//  MondaysApp
//
//  Created by Bema on 19/3/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }

    func start()
}

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        goToSettingsPage()
    }

    func goToSettingsPage() {
        let settingsController = BestTeamViewController()
        settingsController.appCoordinator = self

        navigationController.pushViewController(settingsController, animated: true)
    }

//    func goToSettingDetailsPage(data: Setting) {
//        let detailsController = DetailViewController(data: data)
//        navigationController.pushViewController(detailsController, animated: true)
//    }
}
