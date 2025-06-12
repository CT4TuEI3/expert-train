// 
//  DetailBuilder.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 11.06.2025.
//

import UIKit

final class DetailBuilder {
    static func createDetailModule(_ photo: MainModel?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, photo: photo)
        view.presenter = presenter
        return view
    }
}
