//
//  TranslateResponse.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import Foundation
//
//{
//    "code": 200,
//    "lang": "en-ru",
//    "text": [
//        "Здравствуй, Мир!"
//    ]
//}

struct TranslateResponse: Codable {
    let code: Int
    let text: [String]
}
