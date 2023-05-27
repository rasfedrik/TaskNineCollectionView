//
//  CollectionViewCell.swift
//  TaskNineCollectionView
//
//  Created by Семён Беляков on 25.05.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        addConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: layoutMargins.left),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -layoutMargins.right),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
    }
    
}
