//
//  CollectionViewCell.swift
//  RxSimpleFlickr
//
//  Created by Tae joong Yoon on 22/09/2018.
//  Copyright © 2018 Tae joong Yoon. All rights reserved.
//

import UIKit

import SnapKit
import Then

class BookCell: UICollectionViewCell {
  
  // MARK: Properties
  
  let bookImage = UIImageView(frame: .zero).then {
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  // MARK: Initialize
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.contentView.addSubview(self.bookImage)
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    fatalError("Interface Builder is not supported!")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    fatalError("Interface Builder is not supported!")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.bookImage.image = nil
  }
  
  // MARK: Constraints
  
  func setupConstraints() {
    self.bookImage.snp.makeConstraints { make in
      make.edges.equalTo(self.contentView)
    }
  }
}
