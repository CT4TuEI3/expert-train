//
//  UICollectionViewExtension.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import UIKit.UICollectionView

extension UICollectionView {
    func registerClass<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCellForIndexPath<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
