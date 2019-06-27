//
//  ViewController.swift
//  RxSimpleFlickr
//
//  Created by Tae joong Yoon on 22/09/2018.
//  Copyright © 2018 Tae joong Yoon. All rights reserved.
//

import UIKit

import Kingfisher
import ReactorKit
import ReusableKit
import RxCocoa
import RxDataSources
import RxOptional
import RxSwift
import SnapKit
import Then

class BookListViewController: UIViewController, ReactorKit.View {
  
  // MARK : Constants
  
  struct Reusable {
    static let flickrCell = ReusableCell<BookCell>()
  }
  
  struct Constant {
    static let cellIdentifier = "cell"
  }
  
  struct Metric {
    static let lineSpacing: CGFloat = 10
    static let intetItemSpacing: CGFloat = 10
    static let edgeInset: CGFloat = 8
  }
  
  // MARK : Rx
  
  var disposeBag = DisposeBag()
  
  // MARK: Properties
  
  let dataSources = RxCollectionViewSectionedReloadDataSource<Books>(configureCell: { dataSource,
                                                                                    collectionView,
                                                                                    indexPath,
                                                                                    item in
    let cell = collectionView.dequeue(Reusable.flickrCell, for: indexPath)
    if let imageURL = item.bookImage(), let url = URL(string: imageURL) {
        cell.bookImage.kf.setImage(with: url)
    }
    
    return cell
  })
  
  let collectionView = UICollectionView(frame: .zero,
                                        collectionViewLayout: UICollectionViewFlowLayout()).then {
    $0.backgroundColor = .white
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(Reusable.flickrCell)
  }
  
  // MARK: Initializing
  
  init(reactor: BookListViewReactor) {
    super.init(nibName: nil, bundle: nil)
    self.reactor = reactor
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Search Joara Novel"
    //self.view.addSubview(self.searchBar)
    self.view.addSubview(self.collectionView)
    
    setupConstraints()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: Constraints
  
  
  func setupConstraints() {
    
    self.collectionView.snp.makeConstraints { make in
      make.top.equalTo(self.view)
      make.left.right.bottom.equalTo(self.view)
    }

  }
  
  // MARK: Binding
  
  func bind(reactor: BookListViewReactor) {
    // DataSource
    self.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    
    self.collectionView.rx.modelSelected(Book.self).subscribe(onNext: { book in
      let view = DetailViewController()
      view.book = book
      self.navigationController?.pushViewController(view, animated: true)
    })
      .disposed(by: disposeBag)
    
    // Action
    Observable.from(optional: Reactor.Action.getBookList)
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
    
    // State
    reactor.state.asObservable().map { $0.books }
      .replaceNilWith([])
      .bind(to: collectionView.rx.items(dataSource: dataSources))
      .disposed(by: disposeBag)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension BookListViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.bounds.size.width - 40) * 0.33,
                  height: (collectionView.bounds.size.width - 40) * 0.33)
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return Metric.lineSpacing
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return Metric.intetItemSpacing
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(Metric.edgeInset,
                            Metric.edgeInset,
                            Metric.edgeInset,
                            Metric.edgeInset)
  }
}
