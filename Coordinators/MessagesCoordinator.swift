//
//  MessagesCoordinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

class MessagesCoordinator: Coordinator {
    override func start() {
        showMessagesScene()
    }
}

fileprivate extension MessagesCoordinator {
    func showMessagesScene() {
        let vc = MessagesController()
        navigationController.pushViewController(vc, animated: false)
    }
}
