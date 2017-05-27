//
//  lightTests.swift
//  lightTests
//
//  Created by Amanda Thongvilu on 23/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import XCTest
@testable import light

class lightTests: XCTestCase {
    //MARK: LibaryItem class tests
    //confirm library item initialiser returns a LibraryItem object when passed valid params
    func testLibraryItemIntalisationSucceeds()
    {
        //book title
        let titleItem = LibraryItem.init(title: "Milk and Honey", itemType: "book", author: "Rupi Kaur", userRating: 0, isbn: "", inTopFive: false, currentItem: false, cover: "", userReview: "")
        XCTAssertNotNil(titleItem)

}
    func testLibraryItemIntalisationFails(){
        //empty title
        let emptyTitleItem = LibraryItem.init(title: "", itemType: "book", author: "Rupi Kaur", userRating: nil, isbn: nil, inTopFive: false, currentItem: false, cover: nil, userReview: nil)
        XCTAssertNil(emptyTitleItem)
    }
    
}
