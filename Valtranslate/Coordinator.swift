//
//  Coordinator.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
