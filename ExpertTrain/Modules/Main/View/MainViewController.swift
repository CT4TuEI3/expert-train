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
        let layout = CollectionLayoutFactory.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerClass(CollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let loaderView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .systemGray
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.mainCollectionView.collectionViewLayout = CollectionLayoutFactory.createLayout()
        })
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubviews(mainCollectionView, loaderView)
        
        setupConstraints()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfPhotos() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCellForIndexPath(indexPath) as CollectionViewCell
        collectionViewCell.configure(presenter?.photoForCell(at: indexPath.item))
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailBuilder.createDetailModule(presenter?.photoForCell(at: indexPath.item))
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
    
    func startLoading() {
        DispatchQueue.main.async {
            self.loaderView.isHidden = false
            self.loaderView.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.loaderView.isHidden = true
            self.loaderView.stopAnimating()
        }
    }
    
    func showError(_ error: any Error) {
        let alert = UIAlertController(title: "❗️Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
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
        
        loaderView.layout {
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        }
    }
}
