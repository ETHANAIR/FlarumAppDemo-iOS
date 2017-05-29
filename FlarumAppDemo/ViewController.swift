//
//  ViewController.swift
//  FlarumAppDemo
//
//  Created by Ethan on 2017/5/29.
//  Copyright © 2017年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate  {
    
    @IBOutlet weak var webView: UIWebView!
    
    //edit the website to any what you want!
    let u2 = URL(string: "https://discuss.flarum.org");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showActivityIndicator()
        webView.delegate = self
        let u = URLRequest(url: u2!);
        webView.loadRequest(u);
        
        //if you do not want the page bounces, set the 'ture' to 'false'
        webView.scrollView.bounces = true;
    }
    func webViewDidFinishLoad(_ webView : UIWebView) {
        hideActivityIndicator()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLayoutSubviews() {
    }
    
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:0.3)
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.startAnimating()
        activityIndicator.tag = 100 // 100 for example
        
        for subview in view.subviews {
            if subview.tag == 100 {
                print("already added")
                return
            }
        }
        
        view.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator() {
        let activityIndicator = view.viewWithTag(100) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
}


