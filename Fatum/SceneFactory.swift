//
//  SceneFactory.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

struct SceneFactory {
    static func makeMainFlow(superCoordinator: CoordinatorProtocol, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavController = UINavigationController()
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
        
        let discoverNavController = UINavigationController()
        discoverNavController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "safari"), tag: 1)
        let discoverCoordinator = DiscoverCoordinator(type: .discover, navigationController: discoverNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(discoverCoordinator)
        discoverCoordinator.start()
        
        let matchNavController = UINavigationController()
        matchNavController.tabBarItem = UITabBarItem(title: "Match!", image: UIImage(systemName: "plus.circle.fill"), tag: 2)
        let matchCoordinator = MatchCoordinator(type: .match, navigationController: matchNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(matchCoordinator)
        matchCoordinator.start()
        
        let messagesNavController = UINavigationController()
        messagesNavController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "bubble"), tag: 3)
        let messagesCoordinator = MessagesCoordinator(type: .messages, navigationController: messagesNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(messagesCoordinator)
        messagesCoordinator.start()
        
        let profileNavController = UINavigationController()
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 4)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let conrollers = [homeNavController, discoverNavController, matchNavController, messagesNavController, profileNavController]
        return TabBarController(controllers: conrollers)
        
    }
}
