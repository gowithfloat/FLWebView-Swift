import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {

    var webView: FLWebViewProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if WKWebView is available
        if #available(iOS 8.0, *) {
            let w = WKWebView(delegateView: self)
            w.frame = self.view.frame
            self.webView = w
            self.view.addSubview(self.webView as! WKWebView)
        } else {
            // In this case we have to fall back on UIWebView
            let w = UIWebView(delegateView: self)
            w.frame = self.view.frame
            self.webView = w
            self.view.addSubview(self.webView as! UIWebView)
        }
        
        // Load a page, in this case we will load our favorite website
        self.webView?.loadRequestFromString("http://www.floatlearning.com/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

