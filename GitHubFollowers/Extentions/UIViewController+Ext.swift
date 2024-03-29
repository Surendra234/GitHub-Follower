//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Surendra on 07/07/23.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView?.backgroundColor = .systemBackground
        containerView?.alpha = 0
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8}
        
        let activityIndecator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndecator)
        activityIndecator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndecator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndecator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityIndecator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStackView(with message: String, in view: UIView) {
        let emptyStackView = GFEmptyStateView(message: message)
        emptyStackView.frame = view.frame
        view.addSubview(emptyStackView)
    }
}
