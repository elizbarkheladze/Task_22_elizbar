//
//  imageLoader.swift
//  Task_22_elizbar
//
//  Created by alta on 8/13/22.
//

import Foundation
import SwiftUI

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadIMage(with url:URL){
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async {[weak self] in
            do{
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self?.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async {[weak self] in
                    self?.image = image
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

