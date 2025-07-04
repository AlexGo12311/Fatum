//
//  MatchCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

class MatchCoordinator: Coordinator {
    override func start() {
        showMatchScene()
    }
}

fileprivate extension MatchCoordinator {
    func showMatchScene() {
        let vc = MatchController()
        navigationController.pushViewController(vc, animated: false)
    }
}
