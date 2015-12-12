import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    var webView: FLWebViewProvider?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Check if WKWebView is available
        if #available(iOS 8.0, *) {
            let w = WKWebView(delegateView: self)
            w.frame = CGRect(origin: CGPointZero, size: self.view.frame.size)
            self.webView = w
        } else {
            // Fallback on earlier versions
            let w = UIWebView(delegateView: self)
            w.frame = CGRect(origin: CGPointZero, size: self.view.frame.size)
            self.webView = w
        }
        
        self.view.addSubview(self.webView as! UIView)
        
        // Load a page, in this case we will load our favorite website
        self.webView?.loadRequestFromString("http://www.gowithfloat.com")
    }

}

