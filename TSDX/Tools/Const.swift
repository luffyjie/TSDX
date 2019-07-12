//
//  Const.swift
//  TSDX
//
//  Created by zwj on 2019/5/4.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
@_exported import Alamofire
@_exported import SnapKit
@_exported import HandyJSON
@_exported import SwiftyJSON
@_exported import Toast_Swift
@_exported import NotificationBannerSwift
@_exported import ESPullToRefresh
@_exported import Kingfisher
@_exported import WeexSDK

//Closure
typealias resultBlock = () ->Void

//Screen
let TSDXScreenWidth: CGFloat = (UIScreen.main.bounds.size.width)
let TSDXScreenHeigth: CGFloat = (UIScreen.main.bounds.size.height)
let TSDXAPPColor: UIColor = #colorLiteral(red: 1, green: 0.4980392157, blue: 0.3137254902, alpha: 1)
let TSDXLightGray: UIColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255,alpha: 1.0)
let TSDXHalfAlpha: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0,alpha: 0.5)

//device
let isIphoneX = (UIDevice.isX() || UIDevice.isXR() || UIDevice.isXRMax())
/*顶部安全区域远离高度*/
let topBarSafeHeight: CGFloat = (isIphoneX ? 44.0: 0)
/*状态栏高度*/
let statusBarHeight: CGFloat = (isIphoneX ? 44.0 : 20.0)
/*状态栏和导航栏总高度*/
let navBarHeight: CGFloat = (isIphoneX ? 88.0 : 64.0)
/*TabBar高度*/
let tabBarHeight: CGFloat = (isIphoneX ? (49.0 + 34.0) : 49.0)
/*底部安全区域远离高度*/
let bottomSafeHeight: CGFloat = (isIphoneX ? 34.0 : 0)
