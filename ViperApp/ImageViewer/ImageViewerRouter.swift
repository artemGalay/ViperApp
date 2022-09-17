//
//  ImageViewerRouter.swift
//  ViperApp
//
//  Created by Артем Галай on 16.09.22.
//

import Foundation

protocol ImageViewerRouterProtocol: AnyObject {
}

class ImageViewerRouter: ImageViewerRouterProtocol {
    weak var viewController: ImageViewerViewController?
}
