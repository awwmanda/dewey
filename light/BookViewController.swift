//
//  BookViewController.swift
//  light
//
//  Created by Amanda Thongvilu on 30/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AuthorLabel: UILabel!
    
    @IBOutlet weak var Rating: RatingControl!
    @IBOutlet weak var ISBNLabel: UILabel!
    @IBOutlet weak var PubDateLabel: UILabel!
    
    var libItems = [LibraryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

            let libraryItems: LibraryItemTableViewController = LibraryItemTableViewController()
            libItems = libraryItems.libItems
        
        TitleLabel.text = "Harry Potter and the Goblet of Fire"//(libItems[].title)
        AuthorLabel.text = "J.K. Rowling"//(libItems[1].author)
        ISBNLabel.text = "9784915512452"//(libItems[1].isbn)
        PubDateLabel.text = "2005"
      //  Rating = (libItems[1].userRating)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
