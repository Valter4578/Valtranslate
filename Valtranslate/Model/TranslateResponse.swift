//
//  TranslateResponse.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import Foundation

struct TranslateResponse: Codable {
    let code: Int
    let text: [String]
}
