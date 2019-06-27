//
//  BookListViewReactor.swift
//  RxSimpleFlickr
//
//  Created by Tae joong Yoon on 24/09/2018.
//  Copyright © 2018 Tae joong Yoon. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class BookListViewReactor: Reactor {
  
  enum Action {
    case getBookList
  }
  
  enum Mutation {
    case bookList([Books])
  }
  
  struct State{
    //var photos: [Photos]?
    var books: [Books]?

  }
  
  var initialState: State = State()

  init() {}
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .getBookList:
        return JoaraService.request()
            .catchErrorJustReturn([])
            .map{[Books(books: $0)]}
            .map{Mutation.bookList($0)}
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .bookList(books):
        newState.books = books
    }
    
    return newState
  }
  
}
