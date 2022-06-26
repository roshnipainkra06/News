//
//  DetailViewController.swift
//  News
//
//  Created by Roshini Painkra on 26/06/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var url : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        
        let fetchUrl = URL(string: url)
        let urlRequest = URLRequest(url: fetchUrl!)
        webView.load(urlRequest)
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
