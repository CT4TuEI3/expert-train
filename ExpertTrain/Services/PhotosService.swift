//
//  UnsplashService.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 10.06.2025.
//

import Foundation

enum PhotoServiceError: Error {
    case invalidAPIKey
    case invalidURL
    case noDataReceived
    case decodingFailed(Error)
    case networkError(Error)
    
    var localizedDescription: String {
        switch self {
            case .invalidAPIKey:
                "Invalid API key configuration"
            case .invalidURL:
                "Invalid URL"
            case .noDataReceived:
                "No data received from server"
            case .decodingFailed(let error):
                "Decoding failed: \(error.localizedDescription)"
            case .networkError(let error):
                "Network error: \(error.localizedDescription)"
        }
    }
}

protocol PhotosServiceProtocol {
    func fetchPhotos(completion: @escaping (Result<[MainModel], PhotoServiceError>) -> Void)
}

final class PhotosService: PhotosServiceProtocol {
    
    // MARK: - Private properties
    
    private let apiKey: String
    private let baseURL = "https://api.unsplash.com/photos/"
    
    // MARK: - Init
    
    init() {
        guard let path = Bundle.main.path(forResource: "Configure", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path),
              let apiKey = config["API_KEY"] as? String else {
            fatalError("Configure.plist not found")
        }
        self.apiKey = apiKey
    }
    
    // MARK: - Methods
    
    func fetchPhotos(completion: @escaping (Result<[MainModel], PhotoServiceError>) -> Void) {
        let urlString = "\(baseURL)?client_id=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            self?.handleResponse(data: data, error: error, completion: completion)
        }
        
        task.resume()
    }
}

// MARK: - Private methods

private
extension PhotosService {
    func handleResponse(data: Data?,
                        error: Error?,
                        completion: @escaping (Result<[MainModel], PhotoServiceError>) -> Void) {
        if let error {
            completion(.failure(.networkError(error)))
            return
        }
        
        guard let data else {
            completion(.failure(.noDataReceived))
            return
        }
        
        do {
            let photos = try JSONDecoder().decode([MainModel].self, from: data)
            completion(.success(photos))
        } catch {
            completion(.failure(.decodingFailed(error)))
        }
    }
}
