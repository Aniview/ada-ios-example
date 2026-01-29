//
//  ViewController.swift
//  AdaExample
//
//  Created by Pavlo Yevtukhov on 27.08.2025.
//

import UIKit
import AdaSdk

final class BasicVC: UIViewController {
    private let config: AdaConfig

    init(config: AdaConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       // let config: AdaConfig = .prod

        // Create the ad view
        let adView = AdaView(config: config)
        adView.translatesAutoresizingMaskIntoConstraints = false
        adView.delegate = self
        adView.sizeDelegate = self

        // Add it to your parent view
        view.addSubview(adView)

        // Example layout constraints
        let maximumPlacementHeight: CGFloat = 480
        NSLayoutConstraint.activate([
            adView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            adView.widthAnchor.constraint(equalTo: view.widthAnchor),
            adView.heightAnchor.constraint(equalToConstant: maximumPlacementHeight) // actually it can change. See "adView.sizeDelegate"
        ])
    }
}

extension BasicVC: AdaViewDelegate {
    func onEvent(_ event: AdaSdk.AdaEvent) {
        print("Ada event: \(event)")
    }
}

extension BasicVC: SizeDelegate {
    func onHeightChange(_ height: CGFloat) {
        print("Ada view needs height: \(height)")
    }
}

