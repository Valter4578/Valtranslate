//
//  AppCoordinator.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var rootViewController: UIViewController
    
    var childCoordinators = [Coordinator]()
    
    private var navigationController: UINavigationController
    private var tabBarController: UITabBarController

    func start() {
        let viewController = TranslateViewController()
        viewController.coordinator = self
        
        let networkManager = NetworkManager()
        let realmService = RealmService()
        viewController.viewModel = TranslateViewModel(networkManager: networkManager, realmService: realmService)
        
        navigationController.pushViewController(viewController, animated: false)
        
        let translateImage = UIImage.resizeImage(image: UIImage(named: "translate")!, targetSize: CGSize(width: 32, height: 32))?.withTintColor(.mainBeige)
        navigationController.tabBarItem = UITabBarItem(title: nil, image: translateImage, selectedImage: nil)
                
        tabBarController.viewControllers = [navigationController]
    }
    
    init(_ navigationController: UINavigationController, _ tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        
        rootViewController = tabBarController
    }
}
