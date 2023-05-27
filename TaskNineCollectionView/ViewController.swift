//
//  ViewController.swift
//  TaskNineCollectionView
//
//  Created by Семён Беляков on 25.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Collection"
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true

        addConstraints()
    }
    
    private func addConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
