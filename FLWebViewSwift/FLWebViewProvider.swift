import Foundation

protocol FLWebViewProvider: class {
    
    func setDelegateViews(viewController: ViewController)
    
    var request: URLRequest? { get }
    
    func currentURL() -> URL?
    
    func loadRequestFromString(urlNameAsString: String!)
    
    func canNavigateBackward() -> Bool
    
    func canNavigateForward() -> Bool
    
    func evaluateJS(javascriptString: String!, completionHandler: (AnyObject, NSError) -> ())
}
