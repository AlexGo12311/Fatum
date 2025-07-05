//
//  ProfileCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        showProfileScene()
    }
}

fileprivate extension ProfileCoordinator {
    func showProfileScene() {
        let vc = ProfileController()
        navigationController.pushViewController(vc, animated: false)
    }
}
