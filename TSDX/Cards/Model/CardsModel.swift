//
//  CardsModel.swift
//  TSDX
//
//  Created by zwj on 2019/5/11.
//  Copyright © 2019 TSDX. All rights reserved.
//

struct CardsModel: HandyJSON {
    var cardsCode: String?
    var nameCN: String?
    var nameEN: String?
    var describe: String?
    var totalCount: Int = 0
    var cardsList: [CardsDetailModel]?
}

struct CardsDetailModel: HandyJSON {
    var codeNum: String?
    var spell: String?
    var phonics: String?
    var phonicsAudio: String?
    var mean: String?
    var meanSub: String?
    var sentenceEN: String?
    var sentenceCN: String?
    var sentenceAudio: String?
    var imageSource: String?
}
