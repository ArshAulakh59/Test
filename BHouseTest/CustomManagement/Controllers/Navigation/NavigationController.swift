//
//  NavigationController.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		configureNavigationBar()
    }
	
	func configureNavigationBar() {
		navigationBar.translucent = false
		navigationBar.tintColor = redColor
		navigationBar.backgroundColor = grayColor
		navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: textColor, NSFontAttributeName: navigationFont!]
	}
}