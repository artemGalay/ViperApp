//
//  WelcomeRouter.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperatupe: Int)
}

class WelcomeRouter: WelcomeRouterProtocol {

    weak var viewController: ViewController?

    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        viewController?.present(vc, animated: true)
    }
}
