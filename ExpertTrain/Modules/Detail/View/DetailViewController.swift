// 
//  DetailViewController.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 11.06.2025.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Dependency
    
    var presenter: DetailPresenterProtocol?    
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        setupConstraints()
    }
}

// MARK: - DetailViewControllerProtocol

extension DetailViewController: DetailViewControllerProtocol {
    func showData(_ data: MainModel?) {
        guard let data else { return }
        title = data.user.username
        imageView.imageFrom(urlString: data.urls.regular)
    }
}

// MARK: - Constraints

private
extension DetailViewController {
    func setupConstraints() {
        imageView.layout {
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        }
    }
}
