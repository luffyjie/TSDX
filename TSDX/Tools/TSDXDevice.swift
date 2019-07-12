//
//  Device.swift
//  TSDX
//
//  Created by zwj on 2019/5/26.
//  Copyright © 2019 TSDX. All rights reserved.
//

import Foundation

enum PhoneDevice: String, CaseIterable {
    case iphone4, iphon4s
    case iphone5, iphone5s, iphone5c, iphoneSE
    case iphone6, iphone6s, iphone7, iphone8
    case iphone6Plus, iphone6sPlus, iphone7Plus, iphone8Plus
    case iphoneX, iphoneXs
    case iphoneXr
    case iphoneXsMax
    
    func description() -> (with: CGFloat, Height: CGFloat, statusBar: CGFloat, navBar: CGFloat,  tabbar: CGFloat, size: CGFloat, ppi: CGFloat, scale: Int) {
        switch self {
        case .iphone4, .iphon4s:
            return (320, 480, 20, 64, 49, 3.5, 326, 2)
        case .iphone5, .iphone5s, .iphone5c, .iphoneSE:
            return (320, 568, 20, 64, 49, 4, 326, 2)
        case .iphone6, .iphone6s, .iphone7, .iphone8:
            return (375, 667, 20, 64, 49, 4.7, 326, 2)
        case .iphone6Plus, .iphone6sPlus, .iphone7Plus, .iphone8Plus:
            return (414, 736, 20, 64, 49, 5.5, 401, 3)
        case .iphoneX, .iphoneXs:
            return (375, 812, 44, 88, 83, 5.8, 458, 3)
        case .iphoneXr:
            return (414, 896, 44, 88, 83, 6.1, 326, 2)
        case .iphoneXsMax:
            return (414, 896, 44, 88, 83, 6.5, 458, 3)
        }
    }
}

extension UIDevice {

    class func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }

    class public func isXR() -> Bool {
        if UIScreen.main.bounds.height == 896 && UIScreen.main.scale == 2 {
            return true
        }
        return false
    }

    class func isXRMax() -> Bool {
        if UIScreen.main.bounds.height == 896 && UIScreen.main.scale == 3 {
            return true
        }
        return false
    }
    
}
