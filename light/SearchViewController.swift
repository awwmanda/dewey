//
//  SearchViewController.swift
//  light
//
//  Created by Amanda Thongvilu on 28/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK:Properties
    
    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var EnterButton: UIButton!
    @IBOutlet weak var SearchLabel: UILabel!
    var urlstring = "http://openlibrary.org/search.json?q="

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                    let searchresults = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                //    let docs = searchresults["docs"] as! [String:Any]
                    //    print (docs)
                    
                    let docs = searchresults["docs"] as! [[String: Any]]
                        //If you want array of task id you can try like
                        let title = docs.flatMap { $0["title_suggest"] as? String }
                        let titleresult = title.first
                        print(docs)
                        print(title)
                    
                    LibraryItem(title: titleresult!, itemType: "book", author: "test", userRating: 0, isbn: "12345", inTopFive: false, currentItem: false, cover: nil, userReview: "")
                    
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
    
        //performSegue(withIdentifier: "searchcomplete", sender: self)
        //note: cover_i plugs into cover API "http://covers.openlibrary.org/b/id/969535-M.jpg"
    }
}
