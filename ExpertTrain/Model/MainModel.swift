//
//  MainModel.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 10.06.2025.
//

import Foundation

struct MainModel: Codable {
    let description: String?
    let altDescription: String?
    let color: String
    let likes: Int
    let urls: PhotoURLs
    let user: User
    
    var displayDescription: String {
        description ?? altDescription ?? "No description"
    }
    
    enum CodingKeys: String, CodingKey {
        case description
        case altDescription = "alt_description"
        case color, likes, urls, user
    }
}

struct PhotoURLs: Codable {
    let thumb: String
    let regular: String
}

struct User: Codable {
    let username: String
}
