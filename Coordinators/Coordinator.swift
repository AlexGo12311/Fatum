//
//  Coorfinator.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

enum CoordinatorTypes {
    case app
    case auth
    case onboarding
    case home
    case discover
    case match
    case profile
    case messages
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(_ child: CoordinatorProtocol)
}

protocol CoordinatorProtocol: AnyObject {
    var type: CoordinatorTypes { get }
    var navigationController: UINavigationController { get }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var window: UIWindow? { get }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ child: CoordinatorProtocol) {
        self.childCoordinators.append(child)
    }
    
    func removeChildCoordinator(_ child: CoordinatorProtocol) {
        self.childCoordinators = childCoordinators.filter {$0 !== child}
    }
}

class Coordinator: CoordinatorProtocol {
    var type: CoordinatorTypes
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol]
    var window: UIWindow?
    var finishDelegate: CoordinatorFinishDelegate?
    
    func start() {
        // Override it for any effect
    }

    func finish() {
        // Override it for any effect
    }
    
    init(type: CoordinatorTypes, navigationController: UINavigationController, childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), window: UIWindow? = nil, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.type = type
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
        self.window = window
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        self.childCoordinators.forEach { $0.finishDelegate = nil }
        self.childCoordinators.removeAll()
    }
}


