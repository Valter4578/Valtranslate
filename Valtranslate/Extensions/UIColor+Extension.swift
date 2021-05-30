//
//  UIColor+Extension.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import UIKit

extension UIColor {
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static var mainPurple: UIColor {
        return UIColor.hexStringToUIColor(hex: "361D32")
    }
    
    static var accentPurple: UIColor {
        return UIColor.hexStringToUIColor(hex: "543C52")
    }
}
