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
        
        contentController.addUserScript(readFromFile(fileName: "native", fileType: "js")!)
        contentController.add(NativeJsScriptMessageHandler(uiViewController: self), name: "native")
        
        return webConfiguration
    }
    
    func readFromFile(fileName: String!, fileType: String!) -> WKUserScript? {
        let localFilePath = Bundle.main.url(forResource: fileName, withExtension: fileType)
        
        do {
            return WKUserScript (
                source: try String(contentsOf: localFilePath!, encoding: String.Encoding.utf8),
                injectionTime: WKUserScriptInjectionTime.atDocumentStart,
                forMainFrameOnly: true)
        } catch {
            return nil
        }
    }
}


