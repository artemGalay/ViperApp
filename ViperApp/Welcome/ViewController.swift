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

    var presenter: WelcomePresenterProtocol?

    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show image", for: .normal)
        button.addTarget(self, action: #selector(didTapImageButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc private func didTapImageButton() {
        presenter?.didTapImageButton()
    }

    init(presenter: WelcomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemFill
        presenter?.viewDidLoaded()
        setupHierarcy()
        setupLayout()
    }

    private func setupHierarcy() {
        view.addSubview(dateLabel)
        view.addSubview(weatherLabel)
        view.addSubview(button)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.widthAnchor.constraint(equalToConstant: 400),

            weatherLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLabel.heightAnchor.constraint(equalToConstant: 50),
            weatherLabel.widthAnchor.constraint(equalToConstant: 300),

            button.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300)
        ])
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
