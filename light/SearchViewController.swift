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
                    let json = try JSONSerialization.jsonWithObjectRoot(with: data!, options: [])
					if let searchresults = json as? [String: Any] {
						if let docs = searchresults["docs"] as? [Any] {
							for doc in docs {
								if let title = doc["title"] as? String,
									let itemType = doc["type"] as? String,
									let author = (doc["author_name"] as? [Any]).first as? String,
									let isbn = doc["isbn"] as? [Any]).first as? String {
										self.newlibitem = LibraryItem(title: title, itemType: itemType, author: author, userRating: 1, isbn: isbn, inTopFive: false, currentItem: false, cover: nil, userReview: "")
										libItems.append(newLibItem)!
									}
							}
						}
					}
                    
                    //self.SearchLabel.text = " " + titleresult!

                 //  for (key, value) in docs {
                //      print("\(key) - \(value) ")
                //    }
                    
                } catch let error as NSError {
                    print(error)
                }
                        }
                                        }
        .resume()
    
     //   performSegue(withIdentifier: "searchcomplete", sender: self)
        //note: cover_i plugs into cover API "http://covers.openlibrary.org/b/id/969535-M.jpg"
    }
    
}
