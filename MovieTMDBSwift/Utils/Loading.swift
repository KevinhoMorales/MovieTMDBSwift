//
//  Loading.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

final class Loading {
    
    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var currentLoadingText: String?
    
    static func show() {
        guard let currentMainWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            print("No main window.")
            return
        }
        show(currentMainWindow)
    }
    
    static func show(_ loadingText: String) {
        guard let currentMainWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            print("No main window.")
            return
        }
        show(currentMainWindow, loadingText: loadingText)
    }
    
    static func show(_ overlayTarget : UIView) {
        show(overlayTarget, loadingText: nil)
    }
    
    static func show(_ overlayTarget : UIView, loadingText: String?) {
        // Clear it first in case it was already shown
        hide()
        
        // Create the overlay
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
        
        overlay.widthAnchor.constraint(equalTo: overlayTarget.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: overlayTarget.heightAnchor).isActive = true
        
        // Create and animate the activity indicator
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        
        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString.uppercased()
            label.textColor = .white
            label.font = UIFont(name: "SofiaPro-Medium", size: 14)
            overlay.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16).isActive = true
            label.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
        }
        
        // Animate the overlay to show
        UIView.animate(withDuration: 0.5) {
            overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
        }
        
        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
        currentLoadingText = loadingText
    }
    
    static func hide() {
        if let overlay = currentOverlay {
            overlay.removeFromSuperview()
            currentOverlay =  nil
            currentLoadingText = nil
            currentOverlayTarget = nil
        }
    }
}
