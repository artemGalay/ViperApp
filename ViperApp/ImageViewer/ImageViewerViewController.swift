//
//  ImageViewerViewController.swift
//  ViperApp
//
//  Created by Артем Галай on 16.09.22.
//

import Foundation

import UIKit

protocol ImageViewerViewProtocol: AnyObject {
    func showImage(image: UIImage)
}

class ImageViewerViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var presenter: ImageViewerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        initialize()
    }
}

private extension ImageViewerViewController {
    func initialize() {
        
    }
}

extension ImageViewerViewController: ImageViewerViewProtocol {
    func showImage(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }


}

