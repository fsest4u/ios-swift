//
//  GitHubSearchViewReactor.swift
//  GitHubSearch
//
//  Created by Suyeol Jeon on 13/05/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class GitHubSearchViewReactor: Reactor {
  enum Action {
    case loadFirstPage
    case loadNextPage
  }

  enum Mutation {
    case setRepos([Book], nextPage: Int?)
    case appendRepos([Book], nextPage: Int?)
    case setLoadingNextPage(Bool)
  }

  struct State {
    var repos: [Book] = []
    var nextPage: Int?
    var isLoadingNextPage: Bool = false

  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
        
    case .loadFirstPage:
        return Observable.concat([
            
            Observable.just(Mutation.setLoadingNextPage(true)),

            // 2) call API and set repos (.setRepos)
            JoaraAPI.request(page: 1)
                .takeUntil(self.action.filter(Action.isUpdateQueryAction))
                .map { Mutation.setRepos($0, nextPage: $1) },
            
            Observable.just(Mutation.setLoadingNextPage(false))
        ])
        
    case .loadNextPage:
      guard !self.currentState.isLoadingNextPage else { return Observable.empty() } // prevent from multiple requests
      guard let page = self.currentState.nextPage else { return Observable.empty() }
      return Observable.concat([
        // 1) set loading status to true
        Observable.just(Mutation.setLoadingNextPage(true)),

        // 2) call API and append repos
        JoaraAPI.request(page: page)
            .takeUntil(self.action.filter(Action.isUpdateQueryAction))
            .map { Mutation.appendRepos($0, nextPage: $1) },
        // 3) set loading status to false
        
        Observable.just(Mutation.setLoadingNextPage(false))
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {

    var newState = state

    switch mutation {
    case let .setRepos(repos, nextPage):
      newState.repos = repos
      newState.nextPage = nextPage
      return newState

    case let .appendRepos(repos, nextPage):
        print("append complete")

      newState.repos.append(contentsOf: repos)
      newState.nextPage = nextPage
      return newState
        
    case let .setLoadingNextPage(isLoadingNextPage):
      newState.isLoadingNextPage = isLoadingNextPage
      return newState
    }
  }
}

extension GitHubSearchViewReactor.Action {
    static func isUpdateQueryAction(_ action: GitHubSearchViewReactor.Action) -> Bool {
//        if case .updateQuery = action {
//            return true
//        } else {
            return false
//        }
    }
}

