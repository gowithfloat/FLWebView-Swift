//
//  ViewController.swift
//  FLWebViewSwift
//
//  Created by Eric Busch on 12/2/14.
//  Copyright (c) 2014 Float Mobile Learning. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    var webView: FLWebViewProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (NSClassFromString("WKWebView") != nil) {
            let w = WKWebView(delegateView: self)
            w.frame = self.view.frame
            self.webView = w
            self.view.addSubview(self.webView as WKWebView)
        } else {
            let w = UIWebView(delegateView: self)
            w.frame = self.view.frame
            self.webView = w
            self.view.addSubview(self.webView as UIWebView)
        }
        
        self.webView?.loadRequestFromString("http://www.floatlearning.com/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

