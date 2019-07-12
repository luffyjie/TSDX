//
//  CardsListViewModel.swift
//  TSDX
//
//  Created by zwj on 2019/5/12.
//  Copyright © 2019 TSDX. All rights reserved.
//

class CardsListMap: HandyJSON {
    var msg: String?
    var ret: Int = 0 // 0 success 1 failure
    var cardsModel = CardsModel()

    required init() {}
}

class CardsListViewModel: NSObject {

    var cardsListMap = CardsListMap()
    var updataBlock: resultBlock?
    
    func requestData(cardsCode: String) {
        let jsonString = CardsAPI.CardsListData(cardsCode: cardsCode)
        if let model = CardsListMap.deserialize(from: jsonString) {
            cardsListMap = model
        }
        updataBlock?()
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        var textHeight: CGFloat = 0
        if let cardsList = cardsListMap.cardsModel.cardsList {
            textHeight += height(model: cardsList[indexPath.row])
        }
        return textHeight
    }
    
    func height(model: CardsDetailModel) -> CGFloat {
        let paddingTop:CGFloat = 10, paddingBottom:CGFloat = 10
        var height: CGFloat = 0
        height += heightLabel(text: model.spell, width: TSDXScreenWidth, fontSize: 18, topSpace: 0)
        height += heightLabel(text: model.mean, width: TSDXScreenWidth - 30, fontSize: 13, topSpace: 5)
        height += heightLabel(text: model.meanSub, width: TSDXScreenWidth - 30, fontSize: 13, topSpace: 5)
        height += heightLabel(text: model.sentenceEN, width: TSDXScreenWidth - 60, fontSize: 13, topSpace: 5)
        height += heightLabel(text: model.sentenceCN, width: TSDXScreenWidth - 60, fontSize: 13, topSpace: 5)
        return height + paddingTop + paddingBottom
    }
    
    func heightLabel(text: String?, width: CGFloat, fontSize: CGFloat, topSpace: CGFloat) ->CGFloat {
        var height: CGFloat = 0
        if let text = text {
            if text.count > 0 {
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: fontSize)
                label.numberOfLines = 0
                label.text = text
                height += label.sizeThatFits(CGSize(width: width, height: CGFloat.infinity)).height + topSpace
            }
        }
        return height
    }
}
