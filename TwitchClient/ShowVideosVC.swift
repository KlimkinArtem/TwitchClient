import Cocoa
import WebKit

class ShowVideosVC: NSViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: correctUrl(nameUrl: .playVideoUrl))!
        let request = URLRequest(url: url)
        webView.load(request)
        self.title = "\(streamerName) | \(streamerTitle)"
    }
    
    
    
    
}
