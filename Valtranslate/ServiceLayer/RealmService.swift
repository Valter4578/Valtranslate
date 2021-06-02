//
//  RealmService.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 02.06.2021.
//

import Foundation
import RxRealm
import RealmSwift
import RxSwift

class RealmService {
    // MARK:- Properties
    private lazy var realm = try! Realm(configuration: .defaultConfiguration)
    private let disposeBag = DisposeBag()
    
    // MARK:- Functions
    func save(_ object: Object) {
        Observable.of(object)
            .subscribe(realm.rx.add())
            .disposed(by: disposeBag)
            
    }
    
    func obtain(of type: Object.Type) -> Observable<[Object]> {
        let objects = realm.objects(type)
        
        return Observable.array(from: objects)
            .map { Array($0) } 
    }
}
