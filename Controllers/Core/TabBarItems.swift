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
    var selectedImage: UIImage?
    var ctag: Int?
    
    init(image: UIImage, selectedImage: UIImage? = UIImage(), ctag: Int) {
        super.init(frame: .zero)
        self.ctag = ctag
        self.image = image
        self.selectedImage = selectedImage

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
            icoImage.tintColor = AccentColors.mainWhite
            icoImage.image = selectedImage
        } else {
            icoImage.tintColor = AccentColors.normalTabIcon.withAlphaComponent(0.5)
            icoImage.image = image
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




//#Preview("CTabBar", traits: .fixedLayout(width: 24, height: 24)) {
//    let button = CTabBarItem(image: UIImage(resource: .icon), ctag: 0)
//
//    return button
//}
            
