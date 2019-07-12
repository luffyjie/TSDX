//
//  HomeViewModel.swift
//  TSDX
//
//  Created by zwj on 2019/5/9.
//  Copyright © 2019 TSDX. All rights reserved.
//

class HomeSourceMap: HandyJSON {
    var msg: String?
    var ret: Int = 0 // 0 success 1 failure
    var sections = [HomeSection]()
    var rowData =  [String: ArticleSourceModel]() // HandJson not support Dictionary<enum, any>

    required init() {}
}

class HomeViewModel: NSObject {
    var homeSourceMap = HomeSourceMap()
    var updataBlock: resultBlock?

    func requestData() {
        let jsonString = HomeAPI.HomeSectionSourceData()
        if let model = HomeSourceMap.deserialize(from: jsonString) {
            homeSourceMap = model
        }
        updataBlock?()
    }
}
