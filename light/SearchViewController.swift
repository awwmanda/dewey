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
    var urlstring = "http://openlibrary.org/search.json?title="

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
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("Error when executing URL task")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //an array for all of the search results
                        let searchResults = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(searchResults)
                    }
                    catch {
                        print ("error while parsing JSON result")
                    }
                    
                    
                    //   performSegue(withIdentifier: "searchcomplete", sender: self)
                }
            }
        }
        task.resume()
    }
}
