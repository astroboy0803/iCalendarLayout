//
//  StickyCollectionViewController.swift
//  iCalendarLayout
//
//  Created by i9400506 on 2021/9/3.
//

import UIKit

// reference: https://www.vadimbulavin.com/sticky-grid-collection-view/
public final class StickyCollectionViewController: UIViewController {
    
    private let collectionView: UICollectionView
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        collectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout() )
        super.init(nibName: nil, bundle: nil)
        setupLayout()
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        let edge: CGFloat = 30
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edge),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0-edge),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: edge),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0-edge),
        ])
        collectionView.backgroundColor = .systemYellow
        view.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

