//
//  ImageDownloader.swift
//  RobustaTask
//
//  Created by zaki kasem on 22/4/21.
//  Copyright © 2021 zaki. All rights reserved.
//

import Foundation
import UIKit


class ImageDownloader {
    
    static func downloadImage(downloadableImage:String,completion:@escaping (UIImage?) -> () ) {
        var image:UIImage?
        guard let url = URL(string: downloadableImage) else {
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf:url ) {
                image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
