// 
//  MainBuilder.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import UIKit

final class MainBuilder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let photoService = PhotosService()
        let presenter = MainPresenter(view: view, photoService: photoService)
        view.presenter = presenter
        return view
    }
}
