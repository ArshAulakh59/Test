//
//  ListTableItemCell.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class ListTableItemCell: UITableViewCell {
	@IBOutlet weak var itemNameLabel: UILabel!
	@IBOutlet weak var itemPriceLabel: UILabel!
}

extension ListTableItemCell {
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
}
