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
    case setRepos([String], nextPage: Int?)
    case appendRepos([String], nextPage: Int?)
  }

  struct State {
    var repos: [String] = []
    var nextPage: Int?
  }

  let initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .loadFirstPage:
        return Observable.concat([
            
            // 2) call API and set repos (.setRepos)
            self.search(page: 1)
                .map { Mutation.setRepos($0, nextPage: $1) },
            ])
    case .loadNextPage:
      guard let page = self.currentState.nextPage else { return Observable.empty() }
      return Observable.concat([

        // 2) call API and append repos
        self.search(page: page)
          .map { Mutation.appendRepos($0, nextPage: $1) },

      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setRepos(repos, nextPage):
      var newState = state
      newState.repos = repos
      newState.nextPage = nextPage
      return newState

    case let .appendRepos(repos, nextPage):
      var newState = state
      newState.repos.append(contentsOf: repos)
      newState.nextPage = nextPage
      return newState

    }
  }

  private func url(page: Int) -> URL? {
    return URL(string: "https://api-dev3.joara.com/v1/book/list.json?api_key=ios_02d89057a1f2c1b4a3391b937c46&device=ios&deviceuid=ios&devicetoken=ios&page=\(page)")
  }

  private func search(page: Int) -> Observable<(repos: [String], nextPage: Int?)> {
    let emptyResult: ([String], Int?) = ([], nil)
    guard let url = self.url(page: page) else { return .just(emptyResult) }
    return URLSession.shared.rx.json(url: url)
      .map { json -> ([String], Int?) in
        print(json)
        guard let dict = json as? [String: Any] else { return emptyResult }
        guard let items = dict["books"] as? [[String: Any]] else { return emptyResult }
        let repos = items.compactMap { $0["subject"] as? String }
        let nextPage = repos.isEmpty ? nil : page + 1
        return (repos, nextPage)
      }
      .do(onError: { error in
        if case let .some(.httpRequestFailed(response, _)) = error as? RxCocoaURLError, response.statusCode == 403 {
          print("⚠️ GitHub API rate limit exceeded. Wait for 60 seconds and try again.")
        }
      })
      .catchErrorJustReturn(emptyResult)
  }
}


