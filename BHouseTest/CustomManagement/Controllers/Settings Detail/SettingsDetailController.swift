//
//  SettingsDetailController.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class SettingsDetailController: UIViewController {
	
}

extension SettingsDetailController {
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}
	
	func configureUI() {
		UserInterface().setCustomBackButton(Selector("goBack"), target: self)
	}
	
	func goBack() {
		navigationController?.popViewControllerAnimated(true)
	}
}
