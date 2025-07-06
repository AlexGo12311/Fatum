//
//  TabBarController.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    init(controllers: [UINavigationController]) {
        super.init(nibName: nil, bundle: nil)
        controllers.forEach { self.addChild($0) }
        controllers.enumerated().forEach { (index,controller) in customTabBarLayer.addArrangedSubview(CTabBarItem(image: controller.tabBarItem.image ?? UIImage(systemName: "questionmark")!, ctag: index))
            print("buttom added with index\(index)")
        }
        selectedIndex = 2
        
        if let selectedBtn = customTabBarLayer.arrangedSubviews[selectedIndex] as? CTabBarItem {
            selectedBtn.isActive = true
        }
        
        tabBar.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customTabBarLayer: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = AccentColors.mainWhite
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.layer.cornerRadius = 32
        
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customTabBarLayer)
        setupCustomTabBarLayer()
    }
    
    @objc func tabPressed(_ sender: UITapGestureRecognizer) {
        guard let senderView = sender.view as? CTabBarItem,
              let tabIndex = senderView.ctag else {
            print("Failed to get CTabBarItem or ctag")
            return
        }
        print("\(tabIndex) pressed, view frame: \(senderView.frame)")
        if tabIndex < viewControllers?.count ?? 0 && tabIndex != selectedIndex {
            if let lastBtn = customTabBarLayer.arrangedSubviews[selectedIndex] as? CTabBarItem {
                lastBtn.isActive = false
            }
            selectedIndex = tabIndex
            senderView.isActive = true
            print("Index \(tabIndex) changed!")
            if let imageView = senderView.subviews.first(where: { $0 is UIImageView }) as? UIImageView {
                animate(imageView)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        setupButtons()
        super.viewDidLayoutSubviews()
        print("customTabBarLayer frame: \(customTabBarLayer.frame)")
        for (index, view) in customTabBarLayer.arrangedSubviews.enumerated() {
            print("CTabBarItem \(index) frame: \(view.frame)")
        }
    }
    
    
    func setupButtons() {
        for button in customTabBarLayer.arrangedSubviews {
            let tapGeasture = UITapGestureRecognizer(target: self, action: #selector(tabPressed(_:)))
            button.addGestureRecognizer(tapGeasture)
            button.isUserInteractionEnabled = true
            print("Geasture recognizer added for \(button)")
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
    }
}

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
