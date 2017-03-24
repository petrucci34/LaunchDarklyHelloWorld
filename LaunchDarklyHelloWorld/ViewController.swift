//
//  ViewController.swift
//  LaunchDarklyHelloWorld
//
//  Created by Korhan Bircan on 3/24/17.
//  Copyright © 2017 Korhan Bircan. All rights reserved.
//

import UIKit
import LaunchDarkly

class ViewController: UIViewController {
    @IBOutlet weak var featureFlagLabel: UILabel!

    fileprivate let featureFlagKey = "test-feature"

    override func viewDidLoad() {
        super.viewDidLoad()

        LDClient.sharedInstance().delegate = self
        checkFeatureValue()
    }

    fileprivate func checkFeatureValue() {
        let featureFlagValue = LDClient.sharedInstance().boolVariation(featureFlagKey, fallback: false)
        updateLabel(value: featureFlagValue)
    }

    fileprivate func updateLabel(value: Bool) {
        featureFlagLabel.text = "\(featureFlagKey): \(value)"
    }
}

extension ViewController: ClientDelegate {
    func featureFlagDidUpdate(_ key: String!) {
        if key == featureFlagKey {
            checkFeatureValue()
        }
    }
}
