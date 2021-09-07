//
//  CalendarCell.swift
//  iCalendarLayout
//
//  Created by BruceHuang on 2021/9/6.
//

import UIKit

internal final class CalendarCell: UICollectionViewCell {
    static let reuseID = "CalendarCell"
    
    let label: UILabel

    override init(frame: CGRect) {
        label = .init()
        
        super.init(frame: frame)

        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        contentView.addSubview(label)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGreen.cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    // TODO: 推開欄位高度
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
//        let size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
//        var frame = layoutAttributes.frame
//        frame.size.height = ceil(size.height)
//        layoutAttributes.frame = frame
//        
//        label.sizeToFit()
//        debugPrint("preferredLayoutAttributesFitting...label.frame.size = \(label.frame.size)")
//        debugPrint("preferredLayoutAttributesFitting...targetSize = \(targetSize)")
//        debugPrint("preferredLayoutAttributesFitting...size = \(size)")
//        debugPrint("preferredLayoutAttributesFitting...frame.size = \(frame.size)")
//        
//        return layoutAttributes
//    }
}
