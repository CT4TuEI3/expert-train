// 
//  MainPresenter.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import Foundation

protocol MainViewControllerProtocol: AnyObject {
    func reloadCollectionView()
    func startLoading()
    func stopLoading()
    func showError(_ error: Error)
}

protocol MainPresenterProtocol {
    func loadData()
    func numberOfPhotos() -> Int
    func photoForCell(at index: Int) -> MainModel
}

final class MainPresenter {
    
    // MARK: - Private properties
    
    private weak var view: MainViewControllerProtocol?
    private let photoService: PhotosServiceProtocol
    private var dataSource: [MainModel] = []
    
    // MARK: - Lifecycle
    
    init(view: MainViewControllerProtocol, photoService: PhotosServiceProtocol) {
        self.view = view
        self.photoService = photoService
    }
    
    // MARK: - Private methods
    
    private func loadPhotos() {
        view?.startLoading()
        photoService.fetchPhotos { [weak self] result in
            guard let self else { return }
            self.view?.stopLoading()
            switch result {
                case .success(let success):
                    dataSource = success
                    self.view?.reloadCollectionView()
                case .failure(let failure):
                    self.view?.showError(failure)
            }
        }
    }
}

// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
    func loadData() {
        loadPhotos()
    }
    
    func numberOfPhotos() -> Int {
        dataSource.count
    }
    
    func photoForCell(at index: Int) -> MainModel {
        dataSource[index]
    }
}
