//
//  ViewController.swift
//  Traffic light
//
//  Created by Vladislav on 19.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Private Propeties
    private let lightOff: CGFloat = 0.3
    private let lightOn: CGFloat = 1
    
    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let halfSideSquare = redView.frame.size.width / 2
        let buttonRounding: CGFloat = 10
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        
        redView.layer.cornerRadius = halfSideSquare
        yellowView.layer.cornerRadius = halfSideSquare
        greenView.layer.cornerRadius = halfSideSquare
        startButton.layer.cornerRadius = buttonRounding
    }
    
    // MARK: - IB Action
    @IBAction func switchTrafficLightButtonPressed() {
        
        let trafficLightColors = (roundingToTenths(redView.alpha),
                                  roundingToTenths(yellowView.alpha),
                                  roundingToTenths(greenView.alpha))
        
        switch trafficLightColors {
        case (lightOff, lightOff, lightOff):
            redView.alpha = lightOn
            startButton.setTitle("NEXT", for: .normal)
        case (lightOn, _, _):
            redView.alpha = lightOff
            yellowView.alpha = lightOn
        case (_, lightOn, _):
            yellowView.alpha = lightOff
            greenView.alpha = lightOn
        case (_, _, lightOn):
            greenView.alpha = lightOff
            redView.alpha = lightOn
        default:
            break
        }
    }
    
    // MARK: - Private Method
    func roundingToTenths(_ viewAlpha: CGFloat) -> CGFloat {
        return round(viewAlpha * 10) / 10
    }
}

