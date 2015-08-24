//
//  AppDelegate.swift
//  BHouseTest
//
//  Created by ArshAulakh on 24/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		applyGlobalConfigurations()
		manuallyConfigureWindow()
		return true
	}
	
	func applyGlobalConfigurations() {
		var appearance = UINavigationBar.appearance()
		if UINavigationBar.instancesRespondToSelector(Selector("setBackIndicatorImage:")) {
			appearance.backIndicatorImage = UIImage(named: "icn_back")
			appearance.backIndicatorTransitionMaskImage = UIImage(named: "icn_back")
		}
	}
	
	//MARK: Confiure Window Manually
	func manuallyConfigureWindow() {
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window?.backgroundColor = UIColor(red: 241/255.0, green: 241/255.0, blue: 241/255.0, alpha: 1.0)
		setupInitialController()
		window?.makeKeyAndVisible()
	}
	
	//MARK: Setup Initial Controller
	func setupInitialController() {
		var navController = NavigationController(nibName: "NavigationController", bundle: NSBundle.mainBundle())
		var listController = ListController(nibName: "ListController", bundle: NSBundle.mainBundle())
		navController.setViewControllers([listController], animated: false)
		window?.rootViewController = navController
	}
}

extension AppDelegate {
	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
}

