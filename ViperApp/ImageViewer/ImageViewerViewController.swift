//
//  ImageViewerViewController.swift
//  ViperApp
//
//  Created by Артем Галай on 16.09.22.
//

import UIKit

protocol ImageViewerViewProtocol: AnyObject {
    func showImage(image: UIImage?)
}

class ImageViewerViewController: UIViewController {

    var presenter: ImageViewerPresenterProtocol?

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(presenter: ImageViewerPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        presenter?.viewDidLoaded()
        initialize()
        setupHierarchy()
        setupLayout()
    }

    func setupHierarchy() {
        view.addSubview(imageView)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

private extension ImageViewerViewController {
    func initialize() {
    }
}

extension ImageViewerViewController: ImageViewerViewProtocol {
    func showImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}
