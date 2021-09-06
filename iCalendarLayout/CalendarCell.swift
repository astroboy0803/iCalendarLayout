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
        backgroundColor = .orange
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
