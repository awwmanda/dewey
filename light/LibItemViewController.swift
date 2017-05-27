//
//  LibItemViewController.swift
//  light
//
//  Created by Amanda Thongvilu on 23/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit
import os.log

class LibItemViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var libraryitem: LibraryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //handle the text field's user inpu through delegate callbacks
        nameTextField.delegate = self
        //enable the save button only if text field has a valid name
        updateSaveButtonState()
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //disable the save button whle editing
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated:true, completion: nil)
    }
    
    
    //tis method lets you configure a view controller before its presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("the save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let title = nameTextField.text ?? ""
        let cover = coverImageView.image
        let userRating = ratingControl.rating
        
        //set the meal to be passed to MealTableViewController after the unwind segue
        libraryitem = LibraryItem(title: title, itemType: "", author: "", userRating: userRating, isbn: "", inTopFive: false, currentItem: false, cover: cover, userReview: "")
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        bookNameLabel.text = "Default Text"
    }
    //MARK: Private methods
    private func updateSaveButtonState(){
        //disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}

