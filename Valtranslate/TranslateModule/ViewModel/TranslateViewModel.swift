//
//  TranslateViewModel.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import Foundation
import RxSwift

protocol TranslateViewModelBase {
    
}

class TranslateViewModel: TranslateViewModelBase {
    // MARK:- Properties
    var historyItems: Observable<[HistoryItem]>
    
    init() {
        
        let mockHistoryData: [HistoryItem] = [.init(wordToTranslate: "Snake", translatedWord: "Змея"), .init(wordToTranslate: "Car", translatedWord: "Машина"), .init(wordToTranslate: "Король", translatedWord: "King")] // later data will come from realm
        let _historyItems = BehaviorSubject<[HistoryItem]>(value: [])
        _historyItems.onNext(mockHistoryData)
        
        historyItems = _historyItems.asObserver()
    }
}
