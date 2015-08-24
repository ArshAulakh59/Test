//
//  SettingsController.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	let cellIdentifier = "SettingsCell"
}

extension SettingsController {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureUI()
		configureTable()
	}
	
	func configureUI() {
		title = "Settings"
		var logButton : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "icn_close"), style: .Plain, target: self, action: Selector("CloseSettings"))
		self.navigationItem.leftBarButtonItem = logButton
	}
	
	func configureTable() {
		tableView.registerNib(UINib(nibName: cellIdentifier, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: cellIdentifier)
	}
}

extension SettingsController: UITableViewDataSource, UITableViewDelegate {
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 30.5
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SettingsCell
		cell.accessoryView = UIImageView(image: UIImage(named: "icn_arrow_right"))
		switch indexPath.row {
		case 0:
			cell.settingNameLabel.text = "Setting One"
		case 1:
			cell.settingNameLabel.text = "Setting Two"
		case 2:
			cell.settingNameLabel.text = "Info"
			cell.accessoryView?.hidden = true
		default:
			print()
		}
		return cell
	}
	
	
	func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
	
	func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		if indexPath.section == 0 && indexPath.row != 2 {
			return indexPath
		} else {
			return nil
		}
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		//Proceed To Detail View
		let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! SettingsCell
		let vc = SettingsDetailController(nibName: "SettingsDetailController", bundle: NSBundle.mainBundle())
		vc.title = selectedCell.settingNameLabel.text
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension SettingsController {
	func CloseSettings() {
		dismissViewControllerAnimated(true, completion: { () -> Void in })
	}
}