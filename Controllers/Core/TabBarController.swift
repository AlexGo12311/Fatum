//
//  TabBarController.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
//    private var isTabBarCustomized = false
    
    var buttons: [CTabBarItem] = []
    
    init(controllers: [UINavigationController]) {
        super.init(nibName: nil, bundle: nil)
        controllers.forEach { self.addChild($0) }
        controllers.enumerated().forEach { (index,controller) in customTabBarLayer.addArrangedSubview(CTabBarItem(image: controller.tabBarItem.image ?? UIImage(systemName: "questionmark")!, ctag: index))
            print("buttom added with index \(index)")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Tab bar buttons
    func createButtons() {
        buttons.forEach { button in customTabBarLayer.addArrangedSubview(button)
        print("button in subview!")
        }
    }
    
    private lazy var customTabBarLayer: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = AccentColors.mainWhite
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.layer.cornerRadius = 32
        
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customTabBarLayer)
        setupCustomTabBarLayer()



//        self.delegate = self
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
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if !isTabBarCustomized {
//            tabBar.setCustomStyle()
//            setupTabBarItems()

//            isTabBarCustomized = true
//        }
//    }
    
//    private func setupTabBarItems() {
//        guard let tabBarItems = tabBar.items else { return }
//        
//        for (index, item) in tabBarItems.enumerated() {
//            if index == 2 { // Центральная вкладка
////                item.image = UIImage(systemName: "plus.circle.fill")?
////                    .withConfiguration(UIImage.SymbolConfiguration(pointSize: 24, weight: .bold))
////                item.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0) // Увеличиваем top для смещения вниз
////                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
//                
//                item.title = nil
//
//            }
//        }
//        
//        // Устанавливаем центральную вкладку активной по умолчанию
//        selectedIndex = 2
//    }
    

    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if let index = tabBar.items?.firstIndex(of: item), let imageView = getImageView(forIndex: index), index != selectedIndex {
//            animate(imageView)
//        }
//    }
    
//    private func getImageView(forIndex index: Int) -> UIImageView? {
//        guard let tabBarItems = tabBar.items, index < tabBarItems.count else {
//            print("Invalid index \(index), items count: ")
//            return nil
//        }
//        
//        // Фильтруем субвью, которые являются UIControl
//        let controls = tabBar.subviews.filter { $0 is UIControl }.sorted { $0.frame.origin.x < $1.frame.origin.x }
//        
//        guard index < controls.count else { return nil }
//        
//        let control = controls[index]
//        
//        // Отключаем clipsToBounds для UIControl
//        control.clipsToBounds = false
//        
//        // Ищем UIImageView внутри UIControl
//        for subview in control.subviews {
//            if let imageView = subview as? UIImageView, imageView.frame.size != .zero {
//                return imageView
//            }
//        }
//        return nil
//    }
    
}

private extension TabBarController {
    func setupCustomTabBarLayer() {
        setShadow(customTabBarLayer)
        customTabBarLayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabBarLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            customTabBarLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            customTabBarLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            customTabBarLayer.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        createButtons()
    }
}

//private extension UITabBar {
//    func setCustomStyle() {
//        let appearence = UITabBarAppearance()
////        UITabBarItem.appearance().imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
//        appearence.
//
//        appearence.stackedLayoutAppearance.selected.iconColor = AccentColors.selectedTabIcon
//        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AccentColors.selectedTabIcon]
//        
//        appearence.stackedLayoutAppearance.normal.iconColor = AccentColors.normalTabIcon
//        appearence.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: AccentColors.normalTabIcon]
//        
//        appearence.backgroundColor = AccentColors.mainWhite
//        self.scrollEdgeAppearance = appearence
//        self.standardAppearance = appearence
//        
//        self.layer.cornerRadius = 24
//        self.layer.maskedCorners = [
//            .layerMinXMinYCorner,
//            .layerMaxXMinYCorner
//        ]
//        self.layer.masksToBounds = true
//        
//        let shadowLayer = CALayer()
//        shadowLayer.frame = self.frame
//        shadowLayer.cornerRadius = self.layer.cornerRadius
//        shadowLayer.backgroundColor = AccentColors.mainWhite.cgColor
//        shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
//        shadowLayer.shadowRadius = 10
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowOpacity = 0.05
//        
//        if let superview = self.superview {
//            superview.layer.insertSublayer(shadowLayer, below: self.layer)
//        }
//        
//        self.itemPositioning = .centered
//        self.itemWidth = 65
//        
//    }
//    
//    
//}
//
