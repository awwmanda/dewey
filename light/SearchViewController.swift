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
    }
    
}
