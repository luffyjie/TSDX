//
//  HomeAPI.swift
//  TSDX
//
//  Created by zwj on 2019/5/8.
//  Copyright © 2019 TSDX. All rights reserved.
//

class HomeAPI: NSObject {
    
    static func HomeDisplaySectionData() -> [String] {
        var headerSections = [String]();
        for section in HomeSection.AllCases() {
            headerSections.append(section.description().name)
        }
        return headerSections
    }

    static func HomeSectionSourceData() -> String? {
        var jsonString: String?
        do {
            let path = Bundle.main.path(forResource: "HomeArticleData", ofType: "json")
            let url =  URL.init(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            jsonString = String.init(data: data, encoding: String.Encoding.utf8)
        } catch let error {
            print(error)
        }
        return jsonString
    }

}
