//
//  HomaPageTableViewCell.swift
//  Marti_Proje
//
//  Created by Yasemin salan on 3.06.2020.
//  Copyright © 2020 Yasemin salan. All rights reserved.
//

import UIKit

class HomaPageTableViewCell: UITableViewCell {

    @IBOutlet weak var lbladress: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
