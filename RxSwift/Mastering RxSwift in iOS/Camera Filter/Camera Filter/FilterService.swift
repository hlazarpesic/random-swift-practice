//
//  FilterService.swift
//  Camera Filter
//
//  Created by Lazar Pešić on 5/2/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import Foundation
import UIKit
import CoreImage
import RxSwift

class FilterService {
    fileprivate var context: CIContext
    
    init() {
        context = CIContext()
    }
    
    func applyFilter(to inputImage: UIImage) -> Observable<UIImage> {
        return Observable<UIImage>.create { observer in
            self.applyFilter(to: inputImage) { filteredImage in
                observer.onNext(filteredImage)
            }
            return Disposables.create()
        }
    }
    
    fileprivate func applyFilter(to inputImage: UIImage, completion: @escaping((UIImage) -> ())) {
        let filter = CIFilter(name: "CICMYKHalftone")
        filter?.setValue(5.0, forKey: kCIInputWidthKey)
        
        if let ciImage = CIImage(image: inputImage) {
            filter?.setValue(ciImage, forKey: kCIInputImageKey)
            if filter?.outputImage != nil {
                completion(UIImage(ciImage: filter!.outputImage!))
            }             
        }
    }
}
