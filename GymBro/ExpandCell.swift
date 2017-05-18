//
//  ExpandCell.swift
//  GymBro
//
//  Created by Eury Colon on 4/25/17.
//  Copyright © 2017 eury colon. All rights reserved.
//

import UIKit

class ExpandCell: UITableViewCell {

    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var nameOfLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
