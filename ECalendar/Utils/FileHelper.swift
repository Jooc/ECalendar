//
//  FileHelper.swift
//  ECalendar
//
//  Created by 齐旭晨 on 2020/4/18.
//  Copyright © 2020 齐旭晨. All rights reserved.
//

import Foundation

enum FileHelper {
    static func loadBundleJSON<T: Decodable>(file: String) -> T{
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else{
            fatalError("Resource not found: \(file)")
        }
        return try! loadJSON(from: url)
    }
    
    static func loadJSON<T: Decodable>(from url: URL) throws -> T{
        let data = try Data(contentsOf: url)
        return try appDecoder.decode(T.self, from: data)
    }
}

let appDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

let appEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
}()
