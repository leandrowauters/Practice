//
//  VenueTableViewCell.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "VenueCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
