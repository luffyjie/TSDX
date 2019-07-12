//
//  CardsAPI.swift
//  TSDX
//
//  Created by zwj on 2019/5/11.
//  Copyright © 2019 TSDX. All rights reserved.
//

import UIKit

class CardsAPI: NSObject {

    static func CardsSourceData() -> String? {
        var jsonString: String?
        do {
            let path = Bundle.main.path(forResource: "CardsData", ofType: "json")
            let url =  URL.init(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            jsonString = String.init(data: data, encoding: String.Encoding.utf8)
        } catch let error {
            print(error)
        }
        return jsonString
    }

    static func CardsListData(cardsCode: String) -> String? {
        var jsonString: String?
        do {
            let path = Bundle.main.path(forResource: "CardsAimData", ofType: "json")
            let url =  URL.init(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            jsonString = String.init(data: data, encoding: String.Encoding.utf8)
        } catch let error {
            print(error)
        }
        return jsonString
    }
}
