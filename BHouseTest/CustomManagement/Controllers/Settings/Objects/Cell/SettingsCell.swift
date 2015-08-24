//
//  SettingsCell.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
	@IBOutlet weak var settingNameLabel: UILabel!
}

extension SettingsCell {
	override func awakeFromNib() {
		super.awakeFromNib()
		// Custom view options
//		accessoryType = UITableViewCellAccessoryType.None
//		accessoryView = UIImageView(image: UIImage(named: "icn_arrow_right"))
//		accessoryView!.backgroundColor = UIColor.clearColor()
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
}
