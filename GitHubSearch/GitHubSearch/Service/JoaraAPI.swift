//
//  JoaraAPI.swift
//  GitHubSearch
//
//  Created by spdevapp on 28/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import Alamofire
import RxSwift
import SwiftyJSON
import ObjectMapper

class JoaraAPI {
    static let baseURL = "https://api-dev3.joara.com/v1/book/list.json/"
    
    static let parameters = [
        "api_key": "ios_02d89057a1f2c1b4a3391b937c46",
        "device": "ios",
        "deviceuid": "ios",
        "devicetoken": "ios",
    ]
    
    static let headers = [
        "Content-Type": "application/json"
    ]

    static func request(page: Int) -> Observable<(repos: [Book], nextPage: Int?)> {
    
        return Observable.create { observer -> Disposable in
            var params = parameters
            params["page"] = String(page)
            
            Alamofire.request(baseURL, parameters: params, headers: headers).responseJSON { response in

                switch response.result {
                case .success(let value):

                    if let result = JSON(value)["books"].rawString(),
                        let books = Mapper<Book>().mapArray(JSONString: result) {
                        let nextPage = books.isEmpty ? nil : page + 1
                        observer.onNext((books, nextPage))

                    }
                    print("request complete")
                    observer.onCompleted()

                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}
