//
//  WKWebView+FLWKWebView.swift
//  FLWebViewSwift
//
//  Created by Eric Busch on 12/4/14.
//  Copyright (c) 2014 Float Mobile Learning. All rights reserved.
//

import UIKit
import WebKit

extension WKWebView: FLWebViewProvider {
    
    var request: NSURLRequest? {
        get {
            return objc_getAssociatedObject(self, associatedObjectKey()) as? NSURLRequest
        }
        set(newValue) {
            objc_setAssociatedObject(self, associatedObjectKey(), newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    convenience init(delegateView: AnyObject) {
        self.init()
        self.UIDelegate = delegateView as? WKUIDelegate
        self.navigationDelegate = delegateView as? WKNavigationDelegate
    }
    
    func associatedObjectKey() -> String {
        return "kAssociatedObjectKey"
    }
    
    func setDelegateViews(viewController: ViewController) {
        self.UIDelegate = viewController as WKUIDelegate
        self.navigationDelegate = viewController as WKNavigationDelegate
    }
    
    func URL() -> NSURL? {
        return self.URL
    }
    
    func canGoBack() -> Bool {
        return self.canGoBack
    }
    
    func loadRequestFromString(urlNameAsString: String!) {
        self.loadRequest(NSURLRequest(URL: NSURL(string: urlNameAsString)!))
    }
    
    func evaluateJavaScript(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        self.evaluateJavaScript(javascriptString, completionHandler: { (AnyObject, NSError) -> Void in
            
        })
    }
}
