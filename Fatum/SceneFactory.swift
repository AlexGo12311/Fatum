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
        homeNavController.tabBarItem = UITabBarItem(title: "Fatum", image: UIImage(systemName: "house"), tag: 0)
        homeNavController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
        
        let discoverNavController = UINavigationController()
        discoverNavController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "safari"), tag: 1)
        discoverNavController.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
        let discoverCoordinator = DiscoverCoordinator(type: .discover, navigationController: discoverNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(discoverCoordinator)
        discoverCoordinator.start()
        
        let matchNavController = UINavigationController()
        matchNavController.tabBarItem = UITabBarItem(title: "Match!", image: UIImage(systemName: "plus"), tag: 2)
        matchNavController.tabBarItem.selectedImage = UIImage(systemName: "plus.circle.fill")
        let matchCoordinator = MatchCoordinator(type: .match, navigationController: matchNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(matchCoordinator)
        matchCoordinator.start()
        
        let messagesNavController = UINavigationController()
        messagesNavController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "bubble"), tag: 3)
        messagesNavController.tabBarItem.selectedImage = UIImage(systemName: "bubble.fill")
        let messagesCoordinator = MessagesCoordinator(type: .messages, navigationController: messagesNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(messagesCoordinator)
        messagesCoordinator.start()
        
        let profileNavController = UINavigationController()
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 4)
        profileNavController.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let conrollers = [homeNavController, discoverNavController, matchNavController, messagesNavController, profileNavController]
        return TabBarController(controllers: conrollers)
        
    }
}
