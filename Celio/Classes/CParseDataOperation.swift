//
//  CParseDataOperation.swift
//  Celio
//
//  Created by MP-11 on 01/08/18.
//  Copyright © 2018 Jatin. All rights reserved.
//

import Foundation

open class CParseDataOperation<T: Codable>: COperation {

    open var dataFetched: Data?
    open var parsedData: T?

    override func execute() {
        
        guard let dataFetched = dataFetched else {
            finish(with: NSError(domain: "Parse Data Error", code: 0, userInfo: ["error": "Data is Empty"]))
            return
        }
        do {
            parsedData = try JSONDecoder().decode(T.self, from: dataFetched)
            finish()
        } catch {
            finish(with: NSError(domain: "Parse Data Error",
                                 code: 0,
                                 userInfo: ["error": "Cannot parse to model \(T.self)"]))
        }
    }

}
