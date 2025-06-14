//
//  ImageProvider.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 14.06.2025.
//

import UIKit

protocol ImageProviderProtocol {
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    func cancelLoading(for imageView: UIImageView)
}

final class ImageProvider: ImageProviderProtocol {
    
    // MARK: - Private properties
    
    private let imageCache = NSCache<NSString, UIImage>()
    private var loadingTasks: [UIImageView: URLSessionDataTask] = [:]
    
    // MARK: - Public methods
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.imageCache.setObject(image, forKey: urlString as NSString)
            completion(image)
        }
        
        task.resume()
    }
    
    func cancelLoading(for imageView: UIImageView) {
        if let existingTask = loadingTasks[imageView] {
            existingTask.cancel()
            loadingTasks.removeValue(forKey: imageView)
        }
    }
} 
