//
//  LibraryItemTableViewCell.swift
//  light
//
//  Created by Amanda Thongvilu on 27/5/17.
//  Copyright © 2017 Amanda Thongvilu. All rights reserved.
//

import UIKit

class LibraryItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
