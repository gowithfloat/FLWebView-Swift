import UIKit
import WebKit

@available(iOS 8.0, *)
extension WKWebView: FLWebViewProvider {
    
    // Use associated objects to set and get the request ivar
    func associatedObjectKey() -> String {
        return "kAssociatedObjectKey"
    }
    
    var request: NSURLRequest? {
        get {
            return objc_getAssociatedObject(self, associatedObjectKey()) as? NSURLRequest
        }
        set(newValue) {
            objc_setAssociatedObject(self, associatedObjectKey(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // A simple convenience initializer, this allows for WKWebView(delegateView:) initialization
    convenience init(delegateView: AnyObject) {
        self.init()
        self.UIDelegate = delegateView as? WKUIDelegate
        self.navigationDelegate = delegateView as? WKNavigationDelegate
    }
    
    // We will need to set both the UIDelegate AND navigationDelegate in the case of WebKit
    func setDelegateViews(viewController: ViewController) {
        self.UIDelegate = viewController as WKUIDelegate
        self.navigationDelegate = viewController as WKNavigationDelegate
    }

    func currentURL() -> NSURL? {
        return self.URL
    }
    
    func canNavigateBackward() -> Bool {
        return self.canGoBack
    }
    
    func canNavigateForward() -> Bool {
        return self.canGoForward
    }
    
    // A quick method for loading requests based on strings in a URL format
    func loadRequestFromString(urlNameAsString: String!) {
        self.loadRequest(NSURLRequest(URL: NSURL(string: urlNameAsString)!))
    }
    
    // Pass this up the chain and let WebKit handle it
    func evaluateJS(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        self.evaluateJavaScript(javascriptString, completionHandler: { (AnyObject, NSError) -> Void in
            
        })
    }
}
