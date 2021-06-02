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
    private let disposeBag = DisposeBag()
    private let networkManager: NetworkManager
    
    // MARK:- Inputs
    let textToTranslate = PublishSubject<String>()
    
    // MARK:- Output
    let historyItems: Observable<[HistoryItem]>
    let translatedText: Observable<String>
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
                
        translatedText = textToTranslate
            .flatMapLatest{ (text) -> Observable<String> in
                networkManager.translateText(text).map{ $0.text[0] }
                    .catchErrorJustReturn("Error ocured")
            }

        let mockHistoryData: [HistoryItem] = [.init(wordToTranslate: "Snake", translatedWord: "Змея"), .init(wordToTranslate: "Car", translatedWord: "Машина"), .init(wordToTranslate: "Король", translatedWord: "King")] // later data will come from realm
        let _historyItems = BehaviorSubject<[HistoryItem]>(value: [])
        _historyItems.onNext(mockHistoryData)
        
        historyItems = _historyItems.asObserver()
    }
}
