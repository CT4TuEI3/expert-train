//
//  UIViewExtension.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import UIKit.UIView

extension UIView {
    func layout(@NSLayoutConstraintBuilder _ builder: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(builder(self))
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

@resultBuilder
struct NSLayoutConstraintBuilder {
    static func buildBlock(_ components: NSLayoutConstraint...) -> [NSLayoutConstraint] {
        components
    }
}
