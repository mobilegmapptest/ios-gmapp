//
//  NativeJsScriptMessageHandler.swift
//  ios-gmapp
//
//  Created by Maite Balhester on 24/03/17.
//  Copyright © 2017 Maite Balhester. All rights reserved.
//

import Foundation
import WebKit

class NativeJsScriptMessageHandler: NSObject, WKScriptMessageHandler {

    var uiViewController: UIViewController!
    
    public init(uiViewController: UIViewController) {
        self.uiViewController = uiViewController
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "native" {
            let sentData = message.body as! Dictionary<String, String>
            
            let message:String? = sentData["message"]
            
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment:"btnOK"), style: .default, handler: nil))
            uiViewController.present(alertController, animated: true) {}
        }
    }
    
    

}
