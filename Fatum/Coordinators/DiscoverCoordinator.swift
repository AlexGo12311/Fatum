//
//  DiscoverCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

class DiscoverCoordinator: Coordinator {
    override func start() {
        showDiscoverScene()
    }
}

fileprivate extension DiscoverCoordinator {
    func showDiscoverScene() {
        let vc = DiscoverController()
        navigationController.pushViewController(vc, animated: false)
    }
}
