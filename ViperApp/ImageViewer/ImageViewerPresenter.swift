//
//  ImageViewerPresenter.swift
//  ViperApp
//
//  Created by Артем Галай on 16.09.22.
//

import UIKit

protocol ImageViewerPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class ImageViewerPresenter {
    weak var view: ImageViewerViewProtocol?
    var router: ImageViewerRouterProtocol
    var interactor: ImageViewerInteractorProtocol

    init(interactor: ImageViewerInteractorProtocol, router: ImageViewerRouterProtocol) {
        self.interactor = interactor
        self.router = router

    }
}

extension ImageViewerPresenter: ImageViewerPresenterProtocol {
    func viewDidLoaded() {
        let image = interactor.getImageForCurrentTemperature()
        view?.showImage(image: image!)
    }
}
