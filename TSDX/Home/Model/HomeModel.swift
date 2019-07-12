//
//  HomeModel.swift
//  TSDX
//
//  Created by zwj on 2019/5/6.
//  Copyright © 2019 TSDX. All rights reserved.
//

enum HomeSection: String, CaseIterable, HandyJSONEnum {
    case personal
    case origin
    case basic
    case professional
    case purpose

    func description() -> (name: String, icon: String) {
        switch self {
        case .personal:
            return ("个人经验分享", "1.jpg")
        case .origin:
            return ("英语起源", "2.jpg")
        case .basic:
            return ("基础知识", "3.jpg")
        case .professional:
            return ("高级知识", "4.jpg")
        case .purpose:
            return ("目标", "5.jpg")
        }
    }
}

struct HomeModel: HandyJSON {
    static let headerBanners: [String] = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
}

enum SourceType {
    case LHTML
    case LTEXT
    case API
}

struct ArticleSourceModel: HandyJSON {
    var sectionName: String?
    var sectionIcon: String?
    var list: [ArticleDetailModel]?
}

struct ArticleDetailModel: HandyJSON {
    var icon: String?
    var title: String?
    var subtitle: String?
    var sourcetype: SourceType?
    var url: String?
}
