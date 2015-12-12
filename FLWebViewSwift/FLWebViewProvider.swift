import Foundation

protocol FLWebViewProvider: class {
    
    func setDelegateViews(viewController: ViewController)
    
    var request: NSURLRequest? { get }
    
    func currentURL() -> NSURL?
    
    func loadRequestFromString(urlNameAsString: String!)
    
    func canNavigateBack() -> Bool
    
    func canNavigateForward() -> Bool
    
    func evaluateJavaScriptString(javascriptString: String!, completionHandler: (AnyObject?, NSError?) -> ())
    
}