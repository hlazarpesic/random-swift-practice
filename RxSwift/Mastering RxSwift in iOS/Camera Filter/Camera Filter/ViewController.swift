//
//  ViewController.swift
//  Camera Filter
//
//  Created by Lazar Pešić on 5/1/19.
//  Copyright © 2019 mobiledev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        applyFilterButton.rx.tap.subscribe(onNext: { [weak self] in
            guard let sourceImage = self?.photoImageView.image else {
                return
            }
//            guard let self = self else { return }
            FilterService().applyFilter(to: sourceImage).subscribe(onNext: { filteredImage in
                print("OnNext")
                DispatchQueue.main.async {
                    self?.photoImageView.image = filteredImage
                }
            }).disposed(by: self!.disposeBag)
        }).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController, let photoCollectionViewController = navC.viewControllers.first as? PhotosCollectionViewController else { return }
        
        photoCollectionViewController.selectedPhoto.subscribe(onNext: { [weak self] image in
            self?.updateUI(image: image)
        }).disposed(by: disposeBag)
    }
    
    fileprivate func updateUI(image: UIImage) {
        photoImageView.image = image
        applyFilterButton.isHidden = false
    }
}

