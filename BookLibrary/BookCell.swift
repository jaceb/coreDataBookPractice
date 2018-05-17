//
//  BookCell.swift
//  BookLibrary
//
//  Created by Jace on 5/14/18.
//  Copyright © 2018 Jace. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {


    @IBOutlet weak var numberOfPagesLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var checkedOutLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
