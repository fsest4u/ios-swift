//
//  PhotoListViewReactor.swift
//  RxSimpleFlickr
//
//  Created by Tae joong Yoon on 24/09/2018.
//  Copyright © 2018 Tae joong Yoon. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class PhotoListViewReactor: Reactor {
  
  enum Action {
    case searchFlickr(String)
    case getBookList(String)
  }
  
  enum Mutation {
    case flickrList([Photos])
    case bookList([Books])
  }
  
  struct State{
    var photos: [Photos]?
    var books: [Books]?

  }
  
  var initialState: State = State()

  init() {}
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .searchFlickr(keyword):
      return AppService.request(keyword: keyword)
              .catchErrorJustReturn([])
              .map{[Photos(photos: $0)]}
              .map {Mutation.flickrList($0)}
    case let .getBookList(keyword):
        return JoaraService.request()
            .catchErrorJustReturn([])
            .map{[Books(books: $0)]}
            .map{Mutation.bookList($0)}
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .flickrList(photos):
      newState.photos = photos
    case let .bookList(books):
        newState.books = books
    }
    
    return newState
  }
  
}
