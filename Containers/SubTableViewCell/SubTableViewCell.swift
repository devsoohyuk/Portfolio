//
//  SubTableViewCell.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/06.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {
    @IBOutlet weak var lblRegionName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblRegionName.textAlignment = NSTextAlignment.center
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
