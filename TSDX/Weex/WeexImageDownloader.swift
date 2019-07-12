//
//  WeexImageDownloader.swift
//  TSDX
//
//  Created by zwj on 2019/6/16.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class WeexImageOperation: NSObject, WXImageOperationProtocol {
    
    var url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    func cancel() {
        ImageDownloader.default.cancel(url: url!)
    }
}

class WeexImageDownloader: NSObject, WXImgLoaderProtocol {
    
    func downloadImage(withURL url: String!, imageFrame: CGRect, userInfo options: [AnyHashable : Any]! = [:], completed completedBlock: ((UIImage?, Error?, Bool) -> Void)!) -> WXImageOperationProtocol! {
        let imageUrl = URL.init(string: url);
        let downloader = ImageDownloader.default
        downloader.downloadImage(with: imageUrl!) { result in
            switch result {
            case .success(let value):
                if ((completedBlock) != nil) {
                    completedBlock(value.image, nil, true)
                }
            case .failure(let error):
                print(error)
                completedBlock(nil, error, true)
            }
        }
        return WeexImageOperation.init(url: imageUrl)
    }
}
