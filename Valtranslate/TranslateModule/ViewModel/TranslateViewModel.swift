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
    let error: Observable<Error>
    
    init(networkManager: NetworkManager, realmService: RealmService) {
        self.networkManager = networkManager
                
        let errorSubject = PublishSubject<Error>()
        error = errorSubject.asObservable()
        
        translatedText = textToTranslate
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .filter { !$0.isEmpty }
            .flatMapLatest{ (text) -> Observable<String> in
                networkManager.translateText(text).map{ $0.text[0] }
                    .catchError { error -> Observable<String> in
                        errorSubject.onNext(error)
                        return Observable.just("")
                    }
            }
        
        historyItems = realmService.obtain(of: HistoryItem.self)
            .map {
                return $0 as? [HistoryItem] ?? [HistoryItem()]
            }
    }
}
