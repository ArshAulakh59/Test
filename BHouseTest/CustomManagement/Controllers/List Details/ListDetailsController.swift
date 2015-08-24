//
//  ListDetailsController.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class ListDetailsController: UIViewController {
	@IBOutlet weak var placeholderImageImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var tableView: UITableView!
	
	var sourceCell: ListTableImageCell!
	let itemCellIdentifier = "ListTableItemCell"
	let headerIdentifier = "ListTableHeaderView"
}

extension ListDetailsController {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureUI()
		configureTable()
	}
	
	func configureUI() {
		title = sourceCell.titleLabel.text
		placeholderImageImageView.image = sourceCell.placeholderImageImageView.image
		descriptionLabel.text = sourceCell.descriptionLabel.text
		UserInterface().setCustomBackButton(Selector("goBack"), target: self)
	}
	
	func configureTable() {
		tableView.registerNib(UINib(nibName: itemCellIdentifier, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: itemCellIdentifier)
		tableView.registerNib(UINib(nibName: headerIdentifier, bundle: NSBundle.mainBundle()), forHeaderFooterViewReuseIdentifier: headerIdentifier)
	}
}

extension ListDetailsController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 21
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerIdentifier) as! ListTableHeaderView
		headerView.sectionTitleLabel.text = "Items List"
		return headerView as UIView
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 30.5
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier(itemCellIdentifier, forIndexPath: indexPath) as! ListTableItemCell
		switch indexPath.row {
		case 0:
			cell.itemNameLabel.text = "Item One"
			cell.itemPriceLabel.text = "$10.00"
			return cell
		case 1:
			cell.itemNameLabel.text = "Item Two"
		case 2:
			cell.itemNameLabel.text = "Item Three"
		case 3:
			cell.itemNameLabel.text = "Item Four"
		default:
			print()
		}
		cell.itemPriceLabel.text = "$35.99"
		return cell
	}
	
	func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
}

extension ListDetailsController {
	func goBack() {
		navigationController?.popViewControllerAnimated(true)
	}
}