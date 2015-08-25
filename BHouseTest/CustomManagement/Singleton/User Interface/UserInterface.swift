//
//  UserInterface.swift
//  Locator
//
//  Created by ArshAulakh on 16/06/15.
//  Copyright (c) 2015 ArshAulakh. All rights reserved.
//

import UIKit

class UserInterface: NSObject {
	//MARK: Configure Navigation Controller
	func configureNavigationController(navController: UINavigationController) {
		navController.navigationBar.setBackgroundImage(getImageWithColor(grayColor, size: UIScreen.mainScreen().bounds.size), forBarMetrics: .Default)
		navController.navigationBar.translucent = false
		navController.navigationBar.tintColor = redColor
		navController.navigationBar.backgroundColor = grayColor
		navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: textColor, NSFontAttributeName: navigationFont!]
	}
	
	//MARK: Custom Bar Buttons
	func setCustomBarButton(#isLeftButton: Bool, image: UIImage, selector: Selector, target:UIViewController) {
		var logButton : UIBarButtonItem = UIBarButtonItem(image: image, style: .Plain, target: target, action: selector)
		if isLeftButton {
			target.navigationItem.leftBarButtonItem = logButton
		} else {
			target.navigationItem.rightBarButtonItem = logButton
		}
	}
	
	func setCustomViewBarButton(isLeftButton: Bool, image: UIImage, selector: Selector, target:UIViewController) {
		var btn = UIButton(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
		btn.setImage(image, forState: .Normal)
		btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
		let barbuttonItem = UIBarButtonItem(customView: btn)
		if isLeftButton {
			target.navigationItem.leftBarButtonItem = barbuttonItem
		} else {
			target.navigationItem.rightBarButtonItem = barbuttonItem
		}
	}
	
	//MARK: Configure Back Button
	func setCustomBackButton(selector: Selector, target: AnyObject) {
		let backImage = UIImage(named: "icn_back") as UIImage!
		var btn = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
		btn.setImage(backImage, forState: .Normal)
		btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
		let barbuttonItem = UIBarButtonItem(customView: btn)
		target.navigationItem.leftBarButtonItem = barbuttonItem
	}
	
	//MARK: Get Image With Solid Color
	func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
		let rect = CGRectMake(0, 0, size.width, size.height)
		UIGraphicsBeginImageContextWithOptions(size, false, 0)
		color.setFill()
		UIRectFill(rect)
		let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
	
	//MARK: Downscale Image
	func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage {
		let hasAlpha = true
		let scale: CGFloat = UIScreen.mainScreen().scale
		
		UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
		imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
		
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
		return scaledImage
	}
}