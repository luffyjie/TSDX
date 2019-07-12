//
//  BasicTabBarContentView.swift
//  TSDX
//
//  Created by zwj on 2019/5/2.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class BasicTabBarContentView: ESTabBarItemContentView {
    
    public var duration = 0.3

    override init(frame: CGRect) {
        super.init(frame: frame)
        insets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        textColor = UIColor.init(white: 175.0/255.0, alpha: 1.0)
        highlightTextColor = TSDXAPPColor
        textColor = UIColor.init(white: 175.0/255.0, alpha: 1.0)
        highlightIconColor = TSDXAPPColor
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
    
}
