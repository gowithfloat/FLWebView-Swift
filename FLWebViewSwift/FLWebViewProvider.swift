import Foundation

protocol FLWebViewProvider: class {
    
    func setDelegateViews(viewController: ViewController)
    
    var request: NSURLRequest? { get }
    
    func URL() -> NSURL?
    
    func loadRequestFromString(urlNameAsString: String!)
    
    func canGoBack() -> Bool
    
    func canGoForward() -> Bool
    
    func evaluateJavaScript(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ())
}