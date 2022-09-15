//
//  ViewController.swift
//  ViperApp
//
//  Created by Артем Галай on 15.09.22.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)

}

class ViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    var presenter: WelcomePresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }
    @IBAction func didTapImageButton(_ sender: Any) {
        presenter?.didTapImageButton()
    }
}

extension ViewController: WelcomeViewProtocol {
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.dateLabel.text = date
        }
    }

    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather
        }
    }
}
