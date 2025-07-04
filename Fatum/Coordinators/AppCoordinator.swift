//
//  AppCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//


import UIKit

class AppCoordinator: Coordinator {
    private let factory = SceneFactory.self
    override func start() {
        showMainFlow()
    }
}

fileprivate extension AppCoordinator {
    func showMainFlow() {
        let controller = factory.makeMainFlow(superCoordinator: self, finishDelegate: self)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        window?.rootViewController = controller
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(_ child: CoordinatorProtocol) {
        removeChildCoordinator(child)
        switch child.type {
        case .app:
            return
        default:
            navigationController.popToRootViewController(animated: false)
        }
    }
}
