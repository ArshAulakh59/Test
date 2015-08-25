//
//  ListController.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class ListController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	let imageCellIdentifier = "ListTableImageCell"
	let itemCellIdentifier = "ListTableItemCell"
	let headerIdentifier = "ListTableHeaderView"
}

extension ListController {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configureUI()
		configureTable()
	}
	
	func configureUI() {
		title = "Awesome List View"
		UserInterface().setCustomBarButton(isLeftButton: false, image: UIImage(named: "icn_settings")!, selector: Selector("ShowSettings"), target: self)
	}
	
	func configureTable() {
		tableView.registerNib(UINib(nibName: imageCellIdentifier, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: imageCellIdentifier)
		tableView.registerNib(UINib(nibName: itemCellIdentifier, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: itemCellIdentifier)
		tableView.registerNib(UINib(nibName: headerIdentifier, bundle: NSBundle.mainBundle()), forHeaderFooterViewReuseIdentifier: headerIdentifier)
	}
}

extension ListController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 21
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerIdentifier) as! ListTableHeaderView
		headerView.sectionTitleLabel.text = "Section \(section)"
		return headerView as UIView
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 52
		case 1:
			return 30.5
		default:
			return 0
		}
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 3
		case 1:
			return 2
		default:
			return 0
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			var cell = tableView.dequeueReusableCellWithIdentifier(imageCellIdentifier, forIndexPath: indexPath) as! ListTableImageCell
			cell.placeholderImageImageView.setImageWithURL(imagesSourceURL!)
			cell.titleLabel.text = "Title \(indexPath.row + 1)"
			
			switch indexPath.row {
			case 0:
				cell.descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
			case 1:
				cell.descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean rhoncus, ipsum nec dapibus molestie, libero nibh aliquet nisl, placerat malesuada nisl velit eu enim."
			case 2:
				cell.descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean rhoncus, ipsum nec dapibus molestie, libero nibh aliquet nisl, placerat malesuada nisl velit eu enim. In scelerisque fermentum enim, pellentesque posuere felis mattis vitae. Fusce consectetur rutrum tempus. Donec ligula massa, aliquam nec sollicitudin eget, tincidunt et dolor. Donec lacus ipsum, tincidunt at accumsan ac, congue eget lorem. Vivamus sed libero lectus, vel molestie ante. In in condimentum augue. Mauris imperdiet tellus ac sem iaculis nec rutrum lectus blandit."
			default:
				print()
			}
			
			return cell
		case 1:
			var cell = tableView.dequeueReusableCellWithIdentifier(itemCellIdentifier, forIndexPath: indexPath) as! ListTableItemCell
			
			switch indexPath.row {
			case 0:
				cell.itemNameLabel.text = "Item One"
				cell.itemPriceLabel.text = "$10.00"
			case 1:
				cell.itemNameLabel.text = "Item Two"
				cell.itemPriceLabel.text = "$35.99"
			default:
				print()
			}
			
			return cell
		default:
			return UITableViewCell()
		}
	}
	
	func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView()
	}
	
	func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		if indexPath.section == 0 {
			return indexPath
		} else {
			return nil
		}
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		//Proceed To Detail View
		let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! ListTableImageCell
		let vc = ListDetailsController(nibName: "ListDetailsController", bundle: NSBundle.mainBundle())
		vc.sourceCell = selectedCell
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension ListController {
	func ShowSettings() {
		let settingsObject = SettingsController(nibName: "SettingsController", bundle: NSBundle.mainBundle())
		let navController = UINavigationController(rootViewController: settingsObject)
		UserInterface().configureNavigationController(navController)
		presentViewController(navController, animated: true) { () -> Void in
		}
	}
}