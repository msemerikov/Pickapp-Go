//
//  ProductCollectionViewLayout.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

protocol ProductCollectionViewLayoutDelegate: class {
    func width(forItemAt indexPath: IndexPath) -> CGFloat
    func height(forItemAt indexPath: IndexPath) -> CGFloat
}

class ProductCollectionViewLayout: UICollectionViewLayout {
    
    weak var delegate: ProductCollectionViewLayoutDelegate?
    
    private var cache: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    
    override var collectionViewContentSize: CGSize {
        var maxX = 0.f
        var maxY = 0.f
        for attribute in self.cache.values {
            if maxX < attribute.frame.maxX {
                maxX = attribute.frame.maxX
            }
            if maxY < attribute.frame.maxY {
                maxY = attribute.frame.maxY
            }
        }
        return CGSize(width: maxX, height: maxY)
    }
    
    override func prepare() {
        super.prepare()
        self.cache = [:]
        guard let collectionView = self.collectionView, let delegate = self.delegate else {
            return
        }
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        
        var firstColumnwHeight = 0.f
        var secondColumnHeight = 0.f
        var allAttributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]
        
        for itemIndex in 0 ..< numberOfItems {
            let indexPath = IndexPath(item: itemIndex, section: 0)
            let cellWidth = delegate.width(forItemAt: indexPath)
            let cellHeight = delegate.height(forItemAt: indexPath)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let isForFirstColumn = firstColumnwHeight <= secondColumnHeight
            let x = isForFirstColumn ? 0.0 : cellWidth + 16
            let y = isForFirstColumn ? firstColumnwHeight : secondColumnHeight
            attributes.frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            allAttributes[indexPath] = attributes
            isForFirstColumn ? (firstColumnwHeight += cellHeight + 16) : (secondColumnHeight += cellHeight + 16)
        }
        self.cache = allAttributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.cache.values.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.cache[indexPath]
    }
    
}
