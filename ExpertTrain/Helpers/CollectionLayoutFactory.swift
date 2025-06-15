//
//  CollectionLayoutFactory.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 15.06.2025.
//

import UIKit

enum CollectionLayoutFactory {
    static func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { _, environment -> NSCollectionLayoutSection? in
            let isPad = environment.traitCollection.userInterfaceIdiom == .pad
            let containerSize = environment.container.effectiveContentSize
            let isLandscape = containerSize.width > containerSize.height
            
            let columns = isPad ? (isLandscape ? 4 : 3) : (isLandscape ? 3 : 2)
            
            let spacing: CGFloat = 12.0 * CGFloat(columns - 1)
            let contentInsets: CGFloat = 32.0
            let totalWidth = containerSize.width - spacing - contentInsets
            let itemWidth = totalWidth / CGFloat(columns)
            
            let aspectRatio: CGFloat = {
                if isPad { return isLandscape ? 3/2 : 4/3 }
                return isLandscape ? 1.0 : 16/9
            }()
            
            let itemHeight = itemWidth * aspectRatio
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(columns)),
                                                  heightDimension: .absolute(itemHeight))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(itemHeight))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           repeatingSubitem: item,
                                                           count: columns)
            group.interItemSpacing = .fixed(12.0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 16.0,
                                          leading: 16.0,
                                          bottom: 16.0,
                                          trailing: 16.0)
            section.interGroupSpacing = 16.0
            
            return section
        }
    }
}
