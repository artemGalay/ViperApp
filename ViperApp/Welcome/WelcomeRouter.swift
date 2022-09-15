//
//  WelcomeRouter.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {

}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var presenter: WelcomePresenterProtocol?
}
