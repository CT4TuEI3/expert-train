//
//  UIStackViewExtension.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 10.06.2025.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
