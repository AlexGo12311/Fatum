//
//  UIFont+Ext.swift
//  Fatum
//
//  Created by Alex Neumark on 23.07.2025.
//

import UIKit

extension UIFont {
    enum DPHelix {
        enum Black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.black, size: size) ?? UIFont()
            }
        }
        
        enum BlackItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.blackItalic, size: size) ?? UIFont()
            }
        }
        
        enum Bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.bold, size: size) ?? UIFont()
            }
        }
        
        enum BoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.boldItalic, size: size) ?? UIFont()
            }
        }
        
        enum ExtraBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.extraBold, size: size) ?? UIFont()
            }
        }
        
        enum ExtraBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.extraBoldItalic, size: size) ?? UIFont()
            }
        }
        
        enum Light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.light, size: size) ?? UIFont()
            }
        }
        
        enum LightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.lightItalic, size: size) ?? UIFont()
            }
        }
        
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.medium, size: size) ?? UIFont()
            }
        }
        
        enum MediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.mediumItalic, size: size) ?? UIFont()
            }
        }
        
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.regular, size: size) ?? UIFont()
            }
        }
        
        enum RegularItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.regularItalic, size: size) ?? UIFont()
            }
        }
        
        enum SemiBold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.semiBold, size: size) ?? UIFont()
            }
        }
        
        enum SemiBoldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.semiBoldItalic, size: size) ?? UIFont()
            }
        }
        
        enum Thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.thin, size: size) ?? UIFont()
            }
        }
        
        enum ThinItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.DPHelix.thinItalic, size: size) ?? UIFont()
            }
        }
    }
}


private extension UIFont {
    enum Constants {
        enum DPHelix {
            static let black = "HellixTRIAL-Black"
            static let blackItalic = "HellixTRIAL-BlackItalic"
            static let bold = "HellixTRIAL-Bold"
            static let boldItalic = "HellixTRIAL-BoldItalic"
            static let extraBold = "HellixTRIAL-ExtraBold"
            static let extraBoldItalic = "HellixTRIAL-ExtraBoldItalic"
            static let light = "HellixTRIAL-Light"
            static let lightItalic = "HellixTRIAL-LightItalic"
            static let medium = "HellixTRIAL-Medium"
            static let mediumItalic = "HellixTRIAL-MediumItalic"
            static let regular = "HellixTRIAL-Regular"
            static let regularItalic = "HellixTRIAL-RegularItalic"
            static let semiBold = "HellixTRIAL-SemiBold"
            static let semiBoldItalic = "HellixTRIAL-SemiBoldItalic"
            static let thin = "HellixTRIAL-Thin"
            static let thinItalic = "HellixTRIAL-ThinItalic"
           
        }
    }
}
