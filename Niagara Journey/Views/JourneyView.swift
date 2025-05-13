import SwiftUI
@preconcurrency import WebKit

struct JourneyView: UIViewRepresentable {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("kdkdk") private var first: String = ""
    @AppStorage("djjd") private var second: Bool = false
    @AppStorage("vnnv") private var third: Bool = false
    
    @State var visible: Bool = false
    @State var plan: String
    @State var ldskd: String?
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: JourneyView
        var second: String
        
        init(parent: JourneyView) {
            self.parent = parent
            self.second = parent.plan
        }
        
        @available(iOS 15, *)
        func webView(
            _ webView: WKWebView,
            requestMediaCapturePermissionFor origin: WKSecurityOrigin,
            initiatedByFrame frame: WKFrameInfo,
            type: WKMediaCaptureType,
            decisionHandler: @escaping (WKPermissionDecision) -> Void
        ) {
            decisionHandler(.grant)
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            if let httpResponse = navigationResponse.response as? HTTPURLResponse{
                if httpResponse.statusCode == 404 && !self.parent.second {
                    DispatchQueue.main.async {
                        self.parent.visible = false
                        self.parent.second = true
                        self.parent.first = ""
                        self.parent.navigationViewModel.navigate(to: .onboarding)
                    }
                    decisionHandler(.cancel)
                    return
                } else if httpResponse.statusCode == 200 && !self.parent.third {
                    if let finalUrl = webView.url {
                        self.parent.visible = true
                        self.parent.second = true
                        self.parent.first = finalUrl.absoluteString
                        self.parent.third = true
                    }
                } else {
                    if self.parent.third {
                        self.parent.visible = true
                    }
                }
            }
            decisionHandler(.allow)
        }
        
        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            if let url = navigationAction.request.url {
                self.parent.ldskd = url.absoluteString
            }
            decisionHandler(.allow)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = false
        let swipeLeft = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleSwipe(_:)))
        swipeLeft.direction = .left
        webView.addGestureRecognizer(swipeLeft)
           
        let swipeRight = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleSwipe(_:)))
        swipeRight.direction = .right
        webView.addGestureRecognizer(swipeRight)
        webView.isHidden = true
        if let url = URL(string: plan) {
            webView.load(URLRequest(url: url))
        } else {
            navigationViewModel.navigate(to: .onboarding)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.isHidden = !visible
    }
    
    func loadURL(_ urlString: String) {
        self.ldskd = urlString
    }
}

extension JourneyView.Coordinator {
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard let webView = gesture.view as? WKWebView else { return }
        switch gesture.direction {
        case .left:
            if webView.canGoForward {
                webView.goForward()
            }
        case .right: 
            if webView.canGoBack {
                webView.goBack()
            }
        default:
            break
        }
    }
}
