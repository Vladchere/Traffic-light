//
//  ViewController.swift
//  Traffic light
//
//  Created by Vladislav on 19.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

enum CurrentLight {
	case red, yellow, green
}

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!

    @IBOutlet var startButton: UIButton!
    
    // MARK: - Private Propeties
	private var currentLight = CurrentLight.red
    private let lightIsOff: CGFloat = 0.3
    private let lightIsOn: CGFloat = 1
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

		startButton.layer.cornerRadius = 10

        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }

	override func viewWillLayoutSubviews() {
		redView.layer.cornerRadius = redView.frame.size.width / 2
		yellowView.layer.cornerRadius = yellowView.frame.size.width / 2
		greenView.layer.cornerRadius = greenView.frame.size.width / 2
	}
    
    // MARK: - IB Action
    @IBAction func switchTrafficLightButtonPressed() {

		startButton.setTitle("NEXT", for: .normal)

		switch currentLight {
		case .red:
			redView.alpha = lightIsOn
			greenView.alpha = lightIsOff
			currentLight = .yellow
		case .yellow:
			redView.alpha = lightIsOff
			yellowView.alpha = lightIsOn
			currentLight = .green
		case .green:
			yellowView.alpha = lightIsOff
			greenView.alpha = lightIsOn
			currentLight = .red
		}
    }
}

