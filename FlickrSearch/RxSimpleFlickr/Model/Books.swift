//
//  Books.swift
//  RxSimpleFlickr
//
//  Created by spdevapp on 25/06/2019.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import RxDataSources

struct Books {
    var books: [Book]
}

extension Books : SectionModelType {
    var items: [Book] { return self.books }
    
    init(original: Books, items: [Book]) {
        self = original
        self.books = items
    }
}
