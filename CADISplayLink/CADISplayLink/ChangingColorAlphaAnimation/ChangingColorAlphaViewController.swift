//
//  ChangingColorAlphaViewController.swift
//  CADISplayLink
//
//  Created by Azhman Adam on 8/10/23.
//

import UIKit

final class ChangingColorAlphaViewController: UIViewController {

    @IBOutlet weak var circle: UIView!
    
    private let animationDuration: Double = 5
    private let animationInitializationDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCircle()
        setupDisplayLink()
    }
    
    var alphaValue: CGFloat = 0.0
    var invert: Bool = false
}

// MARK: - Stup Functions
extension ChangingColorAlphaViewController {
    
    func setupCircle() {
        circle.layer.cornerRadius = circle.bounds.width / 2
    }
}

// MARK: - Actions Functions
extension ChangingColorAlphaViewController {
    
    private func setupDisplayLink() {
        let disPlayLink = CADisplayLink(target: self, selector: #selector( handleUpdatingCounterLabel))
        disPlayLink.add(to: .main, forMode: .default)
    }
    
    @objc private func handleUpdatingCounterLabel() {
        invert ? (alphaValue -= 1) : (alphaValue += 1)
        circle.backgroundColor = UIColor.red.withAlphaComponent(alphaValue / 100)
        if alphaValue > 100 || alphaValue < 0 {
            invert = !invert
        }
    }

}
