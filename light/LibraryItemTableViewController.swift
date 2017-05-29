//
//  LibraryItemTableViewController.swift
//  light
//
//  Created by Amanda Thongvilu on 27/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class LibraryItemTableViewController: UITableViewController {
    
    //MARK Properties
    
    var libItems = [LibraryItem]()
    
    //MARK: Actions
    @IBAction func unwindToLibItemList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? LibItemViewController, let libraryitem = sourceViewController.libraryitem {
            //add a new library item
            let newIndexPath = IndexPath(row: libItems.count, section:0)
            libItems.append(libraryitem)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }

        if let sourceViewController = sender.source as? SearchViewController, let libraryitem = sourceViewController.libraryitem {
            //add a new library item
            let newIndexPath = IndexPath(row: libItems.count, section:0)
            libItems.append(libraryitem)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    
    private func loadSampleLibraryItems(){
        let cover1 = UIImage(named: "lib1")
        let cover2 = UIImage(named: "lib2")
        
        guard let lib1 = LibraryItem(title: "Milk and Honey", itemType: "book", author: "Rupi Kaur", userRating: 0, isbn: "978-1-4494-8313-5", inTopFive: false, currentItem: false, cover: cover1, userReview: "") else{
            fatalError("unable to instantiate cover1")
        }
        
        guard let lib2 = LibraryItem(title: "Milk and Honey", itemType: "book", author: "Rupi Kaur", userRating: 0, isbn: "978-1-4494-8313-5", inTopFive: false, currentItem: false, cover: cover2, userReview: "") else{
            fatalError("unable to instantiate cover1")
        }
        
        libItems += [lib1, lib2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // load sample data
        //loadSampleLibraryItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return libItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // table views are reused and should be dequeued using cell id.
        let cellIdentifier = "LibraryItemTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LibraryItemTableViewCell else {
            fatalError("The dequeued ceel is not an instance of LibraryItemTableViewCell")
            
        }

        //fetches the appopriate library item for the data source layout
        let libItem = libItems[indexPath.row]
        
        cell.titleLabel.text = libItem.title
        cell.coverImageView.image = libItem.cover
        cell.ratingControl.rating = libItem.userRating!
        cell.authorLabel.text = libItem.author

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
