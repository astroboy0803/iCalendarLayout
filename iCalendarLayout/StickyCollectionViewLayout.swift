//
//  StickyCollectionViewLayout.swift
//  iCalendarLayout
//
//  Created by i9400506 on 2021/9/3.
//

import UIKit

// reference: https://www.vadimbulavin.com/sticky-grid-collection-view/
internal final class StickyCollectionViewLayout: UICollectionViewFlowLayout {
    
    // MARK: - ZOrder
    private enum ZOrder: Int {
        case commonItem = 0
        case stickyItem = 1
        case staticStickyItem = 2
    }
    
    private var contentSize: CGSize = .zero
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    private var allAttributes: [[UICollectionViewLayoutAttributes]] = .init()
    
//    private let cellSize: CGSize
//    
//    init(cellSize: CGSize? = nil) {
//        if let cellSize = cellSize {
//            self.cellSize = cellSize
//        } else {
//            self.cellSize = .init(width: 100, height: 100)
//        }
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var stickyRowsCount: Int = .zero {
        didSet {
            invalidateLayout()
        }
    }
    
    var stickyColumnsCount: Int = .zero {
        didSet {
            invalidateLayout()
        }
    }
    
    // layout attributes need to be re-calculated when collection view bounds change
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func prepare() {
        print("in...")
        setupAttributes()
        updateStickyItemsPositions()
        updateContentSize()
    }
    
    private func updateContentSize() {
        let lastFrame = allAttributes.last?.last?.frame ?? .zero
        contentSize = .init(width: lastFrame.maxX, height: lastFrame.maxY)
    }
    
    private func updateStickyItemsPositions() {
        debugPrint("updateStickyItemsPositions = \(collectionView?.contentOffset ?? .zero)")
        for row in 0..<rowsCount {
            for col in 0..<columnsCount(in: row) {
                let attributes = allAttributes[row][col]
                if row < stickyRowsCount {
                    var frame = attributes.frame
                    frame.origin.y += collectionView?.contentOffset.y ?? .zero
                    attributes.frame = frame
                }

                if col < stickyColumnsCount {
                    var frame = attributes.frame
                    frame.origin.x += collectionView?.contentOffset.x ?? .zero
                    attributes.frame = frame
                }

                // Z-index (or Z-order) is a common attribute in programming APIs that defines the stack order of specific element within UI hierarchy
                attributes.zIndex = zIndex(forRow: row, column: col).rawValue
            }
        }
    }
    
    private func zIndex(forRow row: Int, column col: Int) -> ZOrder {
        if row < stickyRowsCount && col < stickyColumnsCount {
            return .staticStickyItem
        }
        if row < stickyRowsCount || col < stickyColumnsCount {
            return .stickyItem
        }
        return .commonItem
    }
    
    private func setupAttributes() {
        // 太久的計算會造成卡頓
//        var array: [Int] = []
//        for value in 1...10000 {
//            array.insert(value, at: 0)
//        }
//        print("cal down")
        
        allAttributes.removeAll()
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        
        for row in 0..<rowsCount {
            var rowAttrs: [UICollectionViewLayoutAttributes] = []
            xOffset = 0
            for col in 0..<columnsCount(in: row) {
                let itemSize = size(forRow: row, column: col)
                let indexPath = IndexPath(item: col, section: row)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(x: xOffset, y: yOffset, width: itemSize.width, height: itemSize.height).integral
                rowAttrs.append(attributes)
                xOffset += itemSize.width
            }
            yOffset += rowAttrs.last?.frame.height ?? .zero
            allAttributes.append(rowAttrs)
        }
    }
    
    private var rowsCount: Int {
        collectionView?.numberOfSections ?? .zero
    }
    
    private func columnsCount(in row: Int) -> Int {
        collectionView?.numberOfItems(inSection: row) ?? .zero
    }
    
    private func size(forRow row: Int, column: Int) -> CGSize {
        guard
            let collectionView = collectionView,
            let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout,
            let size = delegate.collectionView?(collectionView, layout: self, sizeForItemAt: .init(item: column, section: row))
        else {
            return .zero
        }
        return size
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        allAttributes
        .flatMap({
            $0.filter({ rect.intersects($0.frame) })
        })
    }
    
    internal func isItemSticky(at indexPath: IndexPath) -> Bool {
        return indexPath.item < stickyColumnsCount || indexPath.section < stickyRowsCount
    }
}
