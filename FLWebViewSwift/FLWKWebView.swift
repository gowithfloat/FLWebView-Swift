import UIKit
import WebKit

@available(iOS 8.0, *)
extension WKWebView: FLWebViewProvider {
    
    // Use associated objects to set and get the request ivar
    func associatedObjectKey() -> String {
        return "kAssociatedObjectKey"
    }
    
    var request: URLRequest? {
        get {
            return objc_getAssociatedObject(self, associatedObjectKey()) as? URLRequest
        }
        set(newValue) {
            objc_setAssociatedObject(self, associatedObjectKey(), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // A simple convenience initializer, this allows for WKWebView(delegateView:) initialization
    convenience init(delegateView: AnyObject) {
        self.init()
        self.uiDelegate = delegateView as? WKUIDelegate
        self.navigationDelegate = delegateView as? WKNavigationDelegate
    }
    
    // We will need to set both the UIDelegate AND navigationDelegate in the case of WebKit
    func setDelegateViews(viewController: ViewController) {
        self.uiDelegate = viewController as WKUIDelegate
        self.navigationDelegate = viewController as WKNavigationDelegate
    }

    func currentURL() -> URL? {
        return self.url
    }
    
    func canNavigateBackward() -> Bool {
        return self.canGoBack
    }
    
    func canNavigateForward() -> Bool {
        return self.canGoForward
    }
    
    // A quick method for loading requests based on strings in a URL format
    func loadRequestFromString(urlNameAsString: String!) {
        _ = self.load(URLRequest(url: URL(string: urlNameAsString)!))
    }
    
    // Pass this up the chain and let WebKit handle it
    func evaluateJS(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        self.evaluateJavaScript(javascriptString, completionHandler: { (AnyObject, NSError) -> Void in
            
        })
    }
}
