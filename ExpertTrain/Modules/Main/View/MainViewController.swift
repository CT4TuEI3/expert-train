// 
//  MainViewController.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: MainPresenterProtocol?
    
    // MARK: - UI Elements
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9,
                                 height: UIScreen.main.bounds.height * 0.5)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerClass(CollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .gray
        view.addSubview(mainCollectionView)
        
        setupConstraints()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionView = collectionView.dequeueReusableCellForIndexPath(indexPath) as CollectionViewCell
        return collectionView
    }
}

// MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    
}

// MARK: - Constraints

private
extension MainViewController {
    func setupConstraints() {        
        mainCollectionView.layout {
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        }
    }
}
