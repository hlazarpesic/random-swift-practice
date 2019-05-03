//
//  PhotosCollectionViewController.swift
//  Camera Filter
//
//  Created by Lazar Pešić on 5/1/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import Foundation
import UIKit
import Photos
import RxSwift

class PhotosCollectionViewController: UICollectionViewController {
    fileprivate var images = [PHAsset]()
    
    fileprivate let selectedPhotoSubject = PublishSubject<UIImage>()
    var selectedPhoto: Observable<UIImage> {
        return selectedPhotoSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            print("Cell not found ")
            return UICollectionViewCell()
        }
        
        let asset = images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100.0, height: 100.0), contentMode: .aspectFit, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 500, height: 500), contentMode: .aspectFit, options: nil) {[weak self] image, info in
            guard let info = info else { return }
            
            let isDegradedImage = info["PHImageResultIsDegradedKey"] as! Bool
            
            if !isDegradedImage {
                if let image = image {
                    self?.selectedPhotoSubject.onNext(image)
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    fileprivate func populatePhotos() {
        PHPhotoLibrary.requestAuthorization({[weak self] status in
            switch status {
            case .authorized:
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects({ (object, count, stop) in
                    self?.images.append(object )
                })
                self?.images.reverse()
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .notDetermined, .restricted:
                break
            case .denied:
                break
            @unknown default:
                print("unknown case")
            }
        })
    }
}
