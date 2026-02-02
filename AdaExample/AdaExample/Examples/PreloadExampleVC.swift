//
//  ViewController.swift
//  AdaExample
//
//  Created by Pavlo Yevtukhov on 27.08.2025.
//

import AdaSdk
import UIKit

final class PreloadExampleVC: UIViewController {
    private let config: AdaConfig

    init(config: AdaConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var adView: AdaView = {
        let view = AdaView(
            config: config,
            preferredAdSize: CGSize(width: 320, height: 250)
        )
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        adView.startLoading()
    }
}

extension PreloadExampleVC: AdaViewDelegate {
    func onEvent(_ event: AdaSdk.AdaEvent) {

        print("Ada event: \(event)")

        switch event {
        case .onImpression:
            guard adView.superview == nil else { return }
            view.addSubview(adView)
            adView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                adView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                adView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                adView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        default:
            break
        }
    }
}

