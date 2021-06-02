//
//  AppCoordinator.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    func start() {
        let viewController = TranslateViewController()
        viewController.coordinator = self
        let networkManager = NetworkManager() 
        viewController.viewModel = TranslateViewModel(networkManager: networkManager)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
