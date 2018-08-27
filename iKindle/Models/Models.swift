//
//  Models.swift
//  iKindle
//
//  Created by Elias Myronidis on 25/08/2018.
//  Copyright © 2018 Elias Myronidis. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let coverImageUrl: String
    let pages: [Page]
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? ""
        author = dictionary["author"] as? String ?? ""
        coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
        
        var bookPages = [Page]()
        if let pagesDictionaries = dictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pagesDictionaries {
                let page = Page(dictionary: pageDictionary)
                bookPages.append(page)
            }
        }
        
        pages = bookPages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(dictionary: [String: Any]) {
        number = dictionary["id"] as? Int ?? 0
        text = dictionary["text"] as? String ?? ""
    }
}
