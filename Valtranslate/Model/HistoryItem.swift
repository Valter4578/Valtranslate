//
//  HistoryItem.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import Foundation
import RealmSwift

@objcMembers
class HistoryItem: Object {
    dynamic var wordToTranslate = String()
    dynamic var translatedWord = String()
    dynamic var isBookmarked = false 
}
