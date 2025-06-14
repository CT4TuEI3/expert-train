//
//  UIImageViewExtensions.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 10.06.2025.
//

import UIKit

extension UIImageView {
    
    private static let imageProvider = ImageProvider()
    
    func imageFrom(urlString: String) {
        Self.imageProvider.cancelLoading(for: self)
        
        self.image = nil
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        self.addSubview(activityIndicator)
        activityIndicator.layout {
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        }
        activityIndicator.startAnimating()
        
        Self.imageProvider.loadImage(from: urlString) { [weak self] image in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview()
                if let image = image {
                    self.image = image
                }
            }
        }
    }
}
