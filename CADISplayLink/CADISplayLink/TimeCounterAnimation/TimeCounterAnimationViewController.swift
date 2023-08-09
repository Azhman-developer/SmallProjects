//
//  ViewController.swift
//  CADISplayLink
//
//  Created by Azhman Adam on 8/9/23.
//

import UIKit

final class TimeCounterAnimationViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    
    private var startValue: Double = 0
    private var endValue: Double = 1000
    private let animationDuration: Double = 5
    private let animationInitializationDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupDisplayLink()
    }
}

// MARK: - Actions
extension TimeCounterAnimationViewController {
    
    private func setupDisplayLink() {
        let disPlayLink = CADisplayLink(target: self, selector: #selector( handleUpdatingCounterLabel))
        disPlayLink.add(to: .main, forMode: .default)
    }
    
    @objc private func handleUpdatingCounterLabel() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationInitializationDate)
        if elapsedTime > animationDuration {
            self.counterLabel.text = "\(endValue)"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = percentage * (endValue - startValue)
            self.counterLabel.text = "\(value)"
        }
    }
}

