//
//  CollectionView.swift
//  TaskNineCollectionView
//
//  Created by Семён Беляков on 27.05.2023.
//

import UIKit

class CollectionView: UICollectionView {
    
    private let cell = CollectionViewCell()
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(CollectionViewCell.self,
                 forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        setCollectionViewLayout(layout, animated: true)
        translatesAutoresizingMaskIntoConstraints = false
        
        layout.collectionView?.contentInset = UIEdgeInsets(
            top: 0,
            left: layout.collectionView!.layoutMargins.left,
            bottom: 0,
            right: 0
        )
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func snapToNearestCell() {
        
        let centerPoint = CGPoint(
            x: layout.collectionView!.contentOffset.x + layout.collectionView!.bounds.width / 2,
            y: layout.collectionView!.bounds.height / 2
        )
        
        guard let indexPath = layout.collectionView?.indexPathForItem(at: centerPoint) else {
            return
        }
        
        layout.collectionView?.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
}

extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 500)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            snapToNearestCell()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToNearestCell()
    }
    
}
