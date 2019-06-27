//
//  JoaraService.swift
//  RxSimpleFlickr
//
//  Created by spdevapp on 25/06/2019.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//


import Alamofire
import RxSwift
import SwiftyJSON
import ObjectMapper

class JoaraService {
    static let baseURL = "https://api-dev3.joara.com/v1/book/list.json/"
    
    static let parameters = [
        "api_key": "ios_02d89057a1f2c1b4a3391b937c46",
        "device": "flickr.photos.search",
        "deviceuid": "json",
        "devicetoken": "100",
        //"page": "1"
    ]
    
    static let headers = [
        "Content-Type": "application/json"
    ]
    
    static func request(page: Int) -> Observable<([Book])> {
        return Observable.create { observer -> Disposable in
            var params = parameters
            params["page"] = String(page)
            
            Alamofire.request(baseURL, parameters: params, headers: headers).responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    if let result = JSON(value)["books"].rawString(),
                        let books = Mapper<Book>().mapArray(JSONString: result) {
                        observer.onNext(books)
                    }
                    
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
