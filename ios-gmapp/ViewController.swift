//
//  ViewController.swift
//  ios-gmapp
//
//  Created by Maite Balhester on 24/03/17.
//  Copyright © 2017 Maite Balhester. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!;
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration();
        let contentController = webConfiguration.userContentController;
        
        contentController.addUserScript(WKUserScript (
            source: "window.alert2 = function(message){window.webkit.messageHandlers.messageBox.postMessage({message:message});};",
            injectionTime: WKUserScriptInjectionTime.atDocumentStart,
            forMainFrameOnly: true))
        contentController.add(self, name: "messageBox")
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let localFilePath = Bundle.main.url(forResource: "home", withExtension: "html")
        let requestObj = URLRequest(url: localFilePath!);
        webView.load(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "messageBox" {
            let sentData = message.body as! Dictionary<String, String>
            
            let message:String? = sentData["message"]
            
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment:"btnOK"), style: .default, handler: nil))
            self.present(alertController, animated: true) {}
        }
    }


}

