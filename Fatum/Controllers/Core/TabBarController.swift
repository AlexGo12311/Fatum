//
//  TabBarController.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var isTabBarCustomized = false
    
    init(controllers: [UINavigationController]) {
        super.init(nibName: nil, bundle: nil)
        controllers.forEach { self.addChild($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !isTabBarCustomized {
            tabBar.setCustomStyle()
            isTabBarCustomized = true
        }
    }
    
    private func animate(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.4)
        }) { _ in
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 7.0,
                           options: .curveEaseInOut,
                           animations: {
                imageView.transform = CGAffineTransform.identity
            })
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item), let imageView = getImageView(forIndex: index), index != selectedIndex {
            animate(imageView)
        }
    }
    
    private func getImageView(forIndex index: Int) -> UIImageView? {
        guard let tabBarButton = tabBar.subviews[index + 1] as? UIControl else { return nil }
        
        for subview in tabBarButton.subviews {
            if let imageView = subview as? UIImageView { return imageView }
        }
        return nil
    }
    
}

private extension UITabBar {
    func setCustomStyle() {
        let appearence = UITabBarAppearance()
        
        appearence.stackedLayoutAppearance.selected.iconColor = AccentColors.selectedTabIcon
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AccentColors.selectedTabIcon]
        
        appearence.stackedLayoutAppearance.normal.iconColor = AccentColors.normalTabIcon
        appearence.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: AccentColors.normalTabIcon]
        
        appearence.backgroundColor = AccentColors.mainWhite
        self.scrollEdgeAppearance = appearence
        self.standardAppearance = appearence
        
        self.layer.cornerRadius = 24
        self.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        self.layer.masksToBounds = true
        
        let shadowLayer = CALayer()
        shadowLayer.frame = self.frame
        shadowLayer.cornerRadius = self.layer.cornerRadius
        shadowLayer.backgroundColor = AccentColors.mainWhite.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
        shadowLayer.shadowRadius = 10
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.05
        
        if let superview = self.superview {
            superview.layer.insertSublayer(shadowLayer, below: self.layer)
        }
        
        self.itemPositioning = .centered
        self.itemWidth = 65
    }
}

