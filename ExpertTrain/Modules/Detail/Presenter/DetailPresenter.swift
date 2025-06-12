// 
//  DetailPresenter.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 11.06.2025.
//

import Foundation

protocol DetailViewControllerProtocol: AnyObject {
    func showData(_ data: MainModel?)
}

protocol DetailPresenterProtocol {
    func loadData()
}

final class DetailPresenter {
    
    // MARK: - Private properties
    
    private weak var view: DetailViewControllerProtocol?
    private let photo: MainModel?
    
    // MARK: - Lifecycle
    
    init(view: DetailViewControllerProtocol, photo: MainModel?) {
        self.view = view
        self.photo = photo
    }
}

// MARK: - DetailPresenterProtocol

extension DetailPresenter: DetailPresenterProtocol {
    func loadData() {
        guard let photo else { return }
        view?.showData(photo)
    }
}
