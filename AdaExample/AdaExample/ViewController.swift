//
//  ViewController.swift
//  AdaExample
//
//  Created by Pavlo Yevtukhov on 27.08.2025.
//

import UIKit
import AdaSdk

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the ad
        let config = AdaConfig(
            pubId: "565c56d3181f46bd608b459a",
            tagId: "68b00e4a7c1583367d03f437"
        )

        // Create the ad view
        let adView = AdaView(config: config)
        adView.translatesAutoresizingMaskIntoConstraints = false
        adView.delegate = self
        adView.sizeDelegate = self

        // Add it to your parent view
        view.addSubview(adView)

        // Example layout constraints
        NSLayoutConstraint.activate([
            adView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            adView.widthAnchor.constraint(equalTo: view.widthAnchor),
            adView.heightAnchor.constraint(equalToConstant: 250) // actually it can change. See "adView.sizeDelegate"
        ])
    }
}

extension ViewController: AdaViewDelegate {
    func onEvent(_ event: AdaSdk.AdaEvent) {
        print("Ada event: \(event)")
    }
}

extension ViewController: SizeDelegate {
    func onHeightChange(_ height: CGFloat) {
        print("Ada view needs height: \(height)")
    }
}

