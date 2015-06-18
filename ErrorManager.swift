//
//  ErrorManager.swift
//
//  Created by Yu-ichiro on 2015/06/18.
//  Copyright © 2015年 Yu-ichiro. All rights reserved.
//

import UIKit

class ErrorManager {
	private init() {
	}
	static let sharedManager:ErrorManager = ErrorManager();
	
	func invokeErrorWithErrorCode(e_code:Int, displayMessage dm:Bool, viewControllerToDisplayAlert vc:UIViewController?) {
		let id = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIdentifier") as! String;
		print("\(NSDate().description) \(id) \(e_code) \(self.localizedMessageForErrorCode(e_code))");
		if dm {
			let ac = UIAlertController(title: "Error", message: self.localizedMessageForErrorCode(e_code), preferredStyle: UIAlertControllerStyle.Alert);
			ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil));
			vc?.presentViewController(ac, animated: true, completion: nil);
		}
	}
	
	func localizedMessageForErrorCode(e_code:Int) -> String {
		return NSBundle.mainBundle().localizedStringForKey(String(e_code), value: "(Unknown Error)", table: "Error")
	}
}