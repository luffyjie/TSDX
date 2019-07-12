//
//  TSDXIndicatorView.swift
//  TSDX
//
//  Created by zwj on 2019/5/28.
//  Copyright © 2019 TSDX. All rights reserved.
//
import Foundation
import UIKit

enum TSDXPageStatus {
    case success
    case loading
    case noContent
    case networkError
    case serviceError
}

class TSDXPageStatusView: UIView {
    
    private var pageList = [UIView]()

    private lazy var loadingView:LoadingView = {
        let view = LoadingView()
        return view
    }()
    
    private lazy var noContentView:NoContentView = {
        let view = NoContentView()
        return view
    }()
    
    private lazy var networkErrorView:NetworkErrorView = {
        let view = NetworkErrorView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addPageView(loadingView)
        addPageView(noContentView)
        addPageView(networkErrorView)
    }
    
    func addPageView(_ view: UIView) {
        addSubview(view)
        pageList.append(view)
        view.snp.updateConstraints({ (make) in
            make.edges.equalToSuperview();
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showStatusView(_ PageStatus: TSDXPageStatus = .success) {
        switch PageStatus {
        case .success:
            disAppear()
        case .loading:
            hideAllPages(loadingView)
        case .noContent:
            hideAllPages(noContentView)
        case .networkError:
            hideAllPages(networkErrorView)
        case .serviceError:
            break
        }
    }
    
    func hideAllPages(_ except: UIView) {
        for page in pageList {
            if except == page {
                page.isHidden = false
            }else {
                page.isHidden = true
            }
        }
    }
    
    func disAppear(){
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 0
        }, completion: { _ in
            self.isHidden = true
            self.alpha = 1
        })
    }
}

class LoadingView: UIView {
    let MTIMAGEWITH = 50
    let MTIMAGEHEIGHT = 50

    lazy var containerView:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        var images = [UIImage]()
        for index in 1 ... 8 {
            if let image = UIImage.init(named: "icon_shake_animation_\(index)") {
                images.append(image)
            }
        }
        imageView.contentMode = .scaleAspectFit
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 0
        imageView.animationImages = images
        imageView.startAnimating()
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "加载中..."
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.equalTo(MTIMAGEWITH)
            make.height.equalTo(MTIMAGEHEIGHT)
            make.centerX.equalToSuperview()
        })
        containerView.addSubview(label)
        label.snp.makeConstraints({ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        })
        containerView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(imageView)
            make.bottom.equalTo(label)
            make.centerY.equalToSuperview().offset(-navBarHeight/2)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NoContentView: UIView {
    let IMAGEWITH = 200
    let IMAGEHEIGHT = 175
    
    lazy var containerView:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "no_content")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "没有找到内容"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.equalTo(IMAGEWITH)
            make.height.equalTo(IMAGEHEIGHT)
            make.centerX.equalToSuperview()
        })
        containerView.addSubview(label)
        label.snp.makeConstraints({ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        })
        containerView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(imageView)
            make.bottom.equalTo(label)
            make.centerY.equalToSuperview().offset(-navBarHeight/2)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NetworkErrorView: UIView {
    let IMAGEWITH = 100
    let IMAGEHEIGHT = 100
    
    lazy var containerView:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "network_error")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "网络出故障了"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.width.equalTo(IMAGEWITH)
            make.height.equalTo(IMAGEHEIGHT)
            make.centerX.equalToSuperview()
        })
        containerView.addSubview(label)
        label.snp.makeConstraints({ (make) in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        })
        containerView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(imageView)
            make.bottom.equalTo(label)
            make.centerY.equalToSuperview().offset(-navBarHeight/2)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
