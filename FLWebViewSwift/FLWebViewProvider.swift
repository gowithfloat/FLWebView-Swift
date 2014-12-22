//
//  FLWebView.swift
//  FLWebViewSwift
//
//  Created by Eric Busch on 12/2/14.
//  Copyright (c) 2014 Float Mobile Learning. All rights reserved.
//

import Foundation

protocol FLWebViewProvider: class {
    
    func setDelegateViews(viewController: ViewController)
    
    var request: NSURLRequest? { get }
    
    func URL() -> NSURL?
    
    func loadRequestFromString(urlNameAsString: String!)
    
    func canGoBack() -> Bool
    
    func evaluateJavaScript(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ())
}