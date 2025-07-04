//
//  HomeCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

class HomeCoordinator: Coordinator {
    override func start() {
        showHomeScene()
    }
}

fileprivate extension HomeCoordinator {
    func showHomeScene() {
        let vc = HomeController()
        navigationController.pushViewController(vc, animated: false)
    }
}
