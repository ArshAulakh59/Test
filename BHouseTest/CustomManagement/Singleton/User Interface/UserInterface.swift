//
//  UserInterface.swift
//  Locator
//
//  Created by ArshAulakh on 16/06/15.
//  Copyright (c) 2015 ArshAulakh. All rights reserved.
//

import UIKit

class UserInterface: NSObject {
	func setCustomBackButton(selector: Selector, target: AnyObject) {
		let backImage = UIImage(named: "icn_back") as UIImage!
		var btn = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
		btn.setImage(backImage, forState: .Normal)
		btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
		let barbuttonItem = UIBarButtonItem(customView: btn)
		target.navigationItem.leftBarButtonItem = barbuttonItem
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