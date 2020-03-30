//
//  StrechyHeaderLayout.swift
//  StretchyHeaderView
//
//  Created by Usama Sadiq on 3/30/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class StrechyHeaderLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind  == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else {return }
                
                let contentOffsetY = collectionView.contentOffset.y
//                print("CollectionView offset = \(contentOffsetY)")
                if contentOffsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                
                let height = attributes.frame.height - contentOffsetY
                
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY , width: width, height: height)
            }
        })
        
        
        return layoutAttributes
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
}
