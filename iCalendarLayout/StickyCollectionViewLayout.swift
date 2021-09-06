//
//  StickyCollectionViewLayout.swift
//  iCalendarLayout
//
//  Created by i9400506 on 2021/9/3.
//

import UIKit

// reference: https://www.vadimbulavin.com/sticky-grid-collection-view/
internal final class StickyCollectionViewLayout: UICollectionViewFlowLayout {
    
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: 10_000, height: 10_000)
//    }
    
    private var allAttributes: [[UICollectionViewLayoutAttributes]] = .init()
    
    override func prepare() {
        print("in...")
        // cpu bound can be blacking
//        var array: [Int] = []
//        for value in 1...10000 {
//            array.insert(value, at: 0)
//        }
//        print("cal down")
        super.prepare()
//        setupAttributes()
    }
    
    private func setupAttributes() {

    }
    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        allAttributes
//        .flatMap({
//            $0.filter({ rect.intersects($0.frame) })
//        })
//    }
}
