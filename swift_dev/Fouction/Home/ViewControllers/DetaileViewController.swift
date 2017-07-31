//
//  DetaileViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/28.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit
import WebKit

class DetaileViewController: UIViewController {

    var urlString :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.progressView.frame = CGRect(x:0,y:64,width:self.view.frame.size.width,height:2)
        self.progressView.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.progressView.progress = 0.0
        }
    }

    func setUpViews() {
        self.title = "详情"
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(self.webView)
        view.addSubview(self.progressView)
    }
    
    // webView
    lazy var webView : WKWebView = {
        let web = WKWebView( frame: CGRect(x:0, y:64,width:ScreenW, height:ScreenH))
        /// 设置访问的URL
        let url = NSURL(string: self.urlString!)
        /// 根据URL创建请求
        let requst = NSURLRequest(url: url! as URL)
        /// 设置代理
        //        web.uiDelegate = self
        web.navigationDelegate = self
        /// WKWebView加载请求
        web.load(requst as URLRequest)
        
        return web
    }()
    
    // 进度条
    lazy var progressView:UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = UIColor.green
        progress.trackTintColor = .clear
        return progress
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DetaileViewController: WKNavigationDelegate{
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        self.navigationItem.title = "加载中..."
        /// 获取网页的progress
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = Float(self.webView.estimatedProgress)
        }
    }
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        
    }
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        /// 获取网页title
        self.title = self.webView.title
        
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = 1.0
            self.progressView.isHidden = true
        }
    }
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
        UIView.animate(withDuration: 0.5) {
            self.progressView.progress = 0.0
            self.progressView.isHidden = true
        }
        /// 弹出提示框点击确定返回
        let alertView = UIAlertController.init(title: "提示", message: "加载失败", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title:"确定", style: .default) { okAction in
            _=self.navigationController?.popViewController(animated: true)
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
        
    }
    
}

