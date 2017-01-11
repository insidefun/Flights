//
//  CardViewCell.swift
//  TestApp
//
//  Created by insidefun on 07.01.17.
//  Copyright © 2017 insidefun. All rights reserved.
//

import UIKit

class CardViewCell: UITableViewCell {

    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var departDateView: UILabel!
    @IBOutlet weak var returnDateView: UILabel!
    @IBOutlet weak var departView: UILabel!
    @IBOutlet weak var returnView: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
