//
//  ViewController.swift
//  ios-gmapp
//
//  Created by Maite Balhester on 24/03/17.
//  Copyright © 2017 Maite Balhester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let localFilePath = Bundle.main.url(forResource: "home", withExtension: "html")
        let requestObj = URLRequest(url: localFilePath!);
        webView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

