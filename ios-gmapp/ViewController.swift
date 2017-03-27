//
//  ViewController.swift
//  ios-gmapp
//
//  Created by Maite Balhester on 24/03/17.
//  Copyright © 2017 Maite Balhester. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    
    override func loadView() {
        let webConfiguration = createContentController()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let localFilePath = Bundle.main.url(forResource: "home", withExtension: "html")
        let requestObj = URLRequest(url: localFilePath!)
        webView.load(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createContentController() -> WKWebViewConfiguration {
        let webConfiguration = WKWebViewConfiguration()
        let contentController = webConfiguration.userContentController;
        
        contentController.addUserScript(WKUserScript (
            source: Bundle.main.url(forResource: "native", withExtension: "js"),
            injectionTime: WKUserScriptInjectionTime.atDocumentStart,
            forMainFrameOnly: true))
        contentController.add(NativeJsScriptMessageHandler(uiViewController: self), name: "messageBox")
        
        return webConfiguration
    }
}

