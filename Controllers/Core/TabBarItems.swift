//
//  TabBarItems.swift
//  Fatum
//
//  Created by Alex Neumark on 05.07.2025.
//

import UIKit

class CTabBarItem: UIView {
    
    var isActive = false {
        didSet {
            changeColor()
        }
    }
    
    var image = UIImage()
    var ctag: Int?
    
    init(image: UIImage, ctag: Int) {
        super.init(frame: .zero)
        self.ctag = tag
        self.image = image

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupItem()
    }
    
    
    lazy var icoImage: UIImageView = {
        $0.image = image
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView())
    
    private func changeColor() {
        if isActive {
            icoImage.tintColor = AccentColors.selectedTabIcon.withAlphaComponent(0.5)
        } else {
            icoImage.tintColor = AccentColors.normalTabIcon
        }
    }
}


private extension CTabBarItem {
    func setupItem() {
        addSubview(icoImage)
        icoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            icoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icoImage.widthAnchor.constraint(equalToConstant: 28),
            icoImage.heightAnchor.constraint(equalToConstant: 28)
        ])
        changeColor()
    }
}




#Preview("CTabBar", traits: .fixedLayout(width: 24, height: 24)) {
    let button = CTabBarItem(image: UIImage(resource: .icon), ctag: 0)

    return button
}
            
