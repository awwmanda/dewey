//
//  SearchViewController.swift
//  light
//
//  Created by Amanda Thongvilu on 28/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit
import os.log

class SearchViewController: UIViewController {
    
    //MARK:Properties
    
    
    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var SearchLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var urlstring = "http://openlibrary.org/search.json?q="
    var libItems = [LibraryItem]()
   // var libraryItem = LibraryItem()
    var newlibitem: LibraryItem?
    var libraryitem: LibraryItem?    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  [[UIApplication sharedApplication] setStatusBarHidden:NO]
        
        let libraryItems: LibraryItemTableViewController = LibraryItemTableViewController()
        libItems = libraryItems.libItems

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // MARK: - Navigation
    
    //tis method lets you configure a view controller before its presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("the save buttonwas not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
     //   let title = "testgin2"
        //  let cover = nil
       // let userRating = 4
        
        //set the item to be passed to LibraryItemTableViewController after the unwind segue
        libraryitem = self.newlibitem
        
    }

    //MARK:Actions
    
    
    
    @IBAction func search(_ sender: UIButton) {
        
    //searching
        
       // var searchdata = SearchBar.text
        let searchdata = (SearchBar.text as! NSString).replacingOccurrences(of: " ", with: "+")
        //append search data to main url
        urlstring = urlstring + searchdata
        
        let url = URL(string: urlstring)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print ("Error when executing URL task")}
            else {
                do{
                    let searchresults = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    let docs = searchresults["docs"] as! [[String: Any]]
                    //print (docs)
                        //If you want array of task id you can try like
                        let title = docs.flatMap { $0["title_suggest"] as? String }
                        let titleresult = title.first
                        print(title.first)
                    let authorresult = docs.flatMap {$0["author_name"] as? Any }
                    //let authorresults = docs[0].valueForKey("author_name") as? String
  //                  print (authorresult)
                    print(authorresult.first)
                    let coverimageid = docs.flatMap {$0["cover_i"] as? Int }
                    //let coverid = coverimageid.first
                    print (coverimageid.first)
                   // let authorname = authorresult[0] as! String ?? ""
                        //authorresult as? String ?? ""
                  //  let authorresult = authorresults.flatMap {$0[
                   //     authorresults.first
                   // let authorresult = author.first
                    
                    //retrieve image url
                    
                    self.newlibitem = LibraryItem(title: titleresult!, itemType: "book", author: "J.K. Rowling", userRating: 0, isbn: "9784915512452", inTopFive: false, currentItem: false, cover: #imageLiteral(resourceName: "lib3"), userReview: "")

                    
                } catch let error as NSError {
                    print(error)
                }
                        }
                                        }
        .resume()
    
     //   performSegue(withIdentifier: "searchcomplete", sender: self)
        //note: cover_i plugs into cover API "http://covers.openlibrary.org/b/id/7236486-M.jpg"
    }
    
}
