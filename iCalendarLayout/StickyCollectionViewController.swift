//
//  StickyCollectionViewController.swift
//  iCalendarLayout
//
//  Created by i9400506 on 2021/9/3.
//

import UIKit

public final class StickyCollectionViewController: UIViewController {
    
    private let collectionView: UICollectionView
        
    private var sections: Int = 100
    private var columns: Int = 100
        
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        collectionView = .init(frame: .zero, collectionViewLayout: StickyCollectionViewLayout())
        super.init(nibName: nil, bundle: nil)
        setupLayout()
        setupCollectionView()
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
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.sections = 10
//            self.columns = 100
//            self.collectionView.reloadData()
//        }
    }
}

extension StickyCollectionViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columns
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.reuseID, for: indexPath)
        
        if let calendarCell = cell as? CalendarCell {
            calendarCell.label.text = "\(indexPath)"
        }

        return cell
    }
}

extension StickyCollectionViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }
}
