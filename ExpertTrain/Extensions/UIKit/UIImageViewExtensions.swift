//
//  UIImageViewExtensions.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 10.06.2025.
//

import UIKit.UIImageView

extension UIImageView {
    func imageFrom(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
