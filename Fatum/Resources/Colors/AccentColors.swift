//
//  AccentColors.swift
//  Fatum
//
//  Created by Alex Neumark on 04.07.2025.
//

import UIKit

struct AccentColors {
    static let bgColor = UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? UIColor(hex: "#FDF7FD") : UIColor(hex: "#1A0D1F")) ?? UIColor.systemBackground
    }
    
    static let selectedTabIcon = UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? UIColor(hex: "DD88CF") : UIColor(hex: "#140A16")) ?? UIColor.systemBackground //TODO: Подобрать цвет для темной темы
    }
    
    static let normalTabIcon = UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? UIColor(hex: "4B164C")?.withAlphaComponent(0.5) : UIColor(hex: "#140A16")) ?? UIColor.systemBackground //TODO: Подобрать цвет для темной темы
    }
    
    static let mainWhite = UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? UIColor(hex: "FFFFFF") : UIColor.black) ?? UIColor.systemBackground //TODO: Подобрать цвет для темной темы
    }
    
}
 
