
//
//  UIWebView+FLUIWebView.swift
//  FLWebViewSwift
//
//  Created by Eric Busch on 12/4/14.
//  Copyright (c) 2014 Float Mobile Learning. All rights reserved.
//

import UIKit

extension UIWebView: FLWebViewProvider {

    convenience init(delegateView: UIWebViewDelegate) {
        self.init()
        self.delegate = delegateView
    }
    
    func setDelegateViews(viewController: ViewController) {
        delegate = viewController
    }
    
    func canGoBack() -> Bool {
        return self.canGoBack
    }
    
    func canGoForward() -> Bool {
        return self.canGoForward
    }
    
    func loadRequestFromString(urlNameAsString: String!) {
        loadRequest(NSURLRequest(URL: NSURL(string: urlNameAsString)!))
    }
    
    func URL() -> NSURL? {
        return self.request?.URL
    }
    
    func evaluateJavaScript(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        var string = stringByEvaluatingJavaScriptFromString(javascriptString)
        
        completionHandler(string!, NSError())
    }
    
    func setScalesPageToFit(setPages: Bool!) {
        self.scalesPageToFit = setPages
    }
    
}
