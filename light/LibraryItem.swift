//
//  LibraryItem.swift
//  light
//
//  Created by Amanda Thongvilu on 27/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class LibraryItem {
    
    //MARK: Properties
    //Variables not Constants as they will need to change later
    
    var title: String
    var itemType: String
    var author: String?
    var userRating: Int?
    var isbn: String?
    var inTopFive: Bool
    var currentItem: Bool
    var cover: UIImage?
    var userReview: String?
    
    enum itemTypes: String {
        case book
        case podcast
    }
    
    //MARK: Initalisation
    init?(title: String, itemType: String, author: String?, userRating: Int?, isbn: String?, inTopFive: Bool, currentItem: Bool, cover: UIImage?, userReview: String?){
        
    //initalisation should fail if title or type are empty
        if title.isEmpty {
            return nil
        }
    
    //MARK: Intitalise stored property variables
    self.title = title
    self.itemType = itemType
    self.author = author
    self.userRating = userRating
    self.isbn = isbn
    self.inTopFive = inTopFive
    self.currentItem = currentItem
    self.cover = cover
    self.userReview = userReview

    
    }
}
