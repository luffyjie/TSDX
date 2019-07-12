//
//  CardsViewModel.swift
//  TSDX
//
//  Created by zwj on 2019/5/11.
//  Copyright © 2019 TSDX. All rights reserved.
//

class CardsSourceMap: HandyJSON {
    var msg: String?
    var ret: Int = 0 // 0 success 1 failure
    var rowData =  [CardsModel]()
    
    required init() {}
}

class CardsViewModel: NSObject {
    
    var cardsSourceMap = CardsSourceMap()
    var updataBlock: resultBlock?

    func requestData() {
        let jsonString = CardsAPI.CardsSourceData()
        if let model = CardsSourceMap.deserialize(from: jsonString) {
            cardsSourceMap = model
        }
        updataBlock?()
    }
}
