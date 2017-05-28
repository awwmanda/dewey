//
//  User.swift
//  light
//
//  Created by Amanda Thongvilu on 28/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class User {
    
    //MARK: Properties
    //Variables not Constants as they will need to change later
    
    var name: String
    var bio: String?
    var topfive: [LibraryItem]?
    var currentread: LibraryItem?
    var currentlisten: LibraryItem?
    var profilepic: UIImage?
    
    //MARK: Initalisation
    init?(name: String, bio: String?, topfive: [LibraryItem]?, currentread: LibraryItem?, currentlisten: LibraryItem?, profilepic: UIImage?){
        
        //initalisation should fail if title or type are empty
        if name.isEmpty {
            return nil
        }
        
        //MARK: Intitalise stored property variables
        self.name = name
        self.bio = bio
        self.topfive = topfive
        self.currentread = currentread
        self.profilepic = profilepic
        
    }
}
