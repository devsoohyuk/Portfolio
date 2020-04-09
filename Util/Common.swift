//
//  Common.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/02.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit


struct ResponseData: Codable {
    var login: [Login]
}

struct Login : Codable {
    var id: String
    var pw: String
    
}

class Common: NSObject {
    
    public func loadJson(filename fileName: String) -> [Login]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.login
                
            } catch {
                print("error:\(error)")
                
            }
        }
        return nil
        
    }

}
