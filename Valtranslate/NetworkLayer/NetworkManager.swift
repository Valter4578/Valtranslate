//
//  NetworkManager.swift
//  Valtranslate
//
//  Created by Максим Алексеев on 30.05.2021.
//

import Foundation
import RxSwift
import Moya
import RxMoya

enum ApiService {
    case translateText(text: String)
}

extension ApiService: TargetType {
    var baseURL: URL {
        return URL(string: "https://translate.yandex.net/api/v1.5")!
    }
    
    var path: String {
        return "/tr.json/translate"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .translateText(let text):
            var params: [String: Any] = [:]
            params["key"] = "trnsl.1.1.20200105T055134Z.7a44cca1172db2a5.461457ea1bca28044e9842532660458ab1f79560"
            params["text"] = text
            params["lang"] = "ru"
            params["options"] = 1
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

class NetworkManager {
    // MARK:- Properties
    private let provider = MoyaProvider<ApiService>()
    
    // MARK:- Methods
    func translateText(_ text: String) -> Single<TranslateResponse> {
        return provider.rx
            .request(.translateText(text: text))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(TranslateResponse.self)
    }
}
