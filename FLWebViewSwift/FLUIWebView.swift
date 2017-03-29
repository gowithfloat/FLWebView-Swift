import UIKit

extension UIWebView: FLWebViewProvider {

    // A simple convenience initializer, this allows for UIWebView(delegateView:) initialization
    convenience init(delegateView: UIWebViewDelegate) {
        self.init()
        self.delegate = delegateView
    }
    
    // UIWebView has one delegate method so this is pretty straight forward
    func setDelegateViews(viewController: ViewController) {
        delegate = viewController
    }
    
    func canNavigateBackward() -> Bool {
        return self.canGoBack
    }
    
    func canNavigateForward() -> Bool {
        return self.canGoForward
    }
    
    // A quick method for loading requests based on strings in a URL format
    func loadRequestFromString(urlNameAsString: String!) {
        loadRequest(URLRequest(url: URL(string: urlNameAsString)!))
    }
    
    func currentURL() -> URL? {
        return self.request?.url
    }
    
    func evaluateJS(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ()) {
        // Have the WebView evaluate the javascript string
      guard let string = stringByEvaluatingJavaScript(from: javascriptString) else { return }
        
        // Call the completion handler from there
        completionHandler(string as AnyObject, NSError(domain: "FLWebView", code: 200, userInfo: nil))
    }
    
    func setScalesPageToFit(setPages: Bool!) {
        self.scalesPageToFit = setPages
    }
    
}
