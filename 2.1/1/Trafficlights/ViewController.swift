//
//  ViewController.swift
//  Trafficlights
//
//  Created by Станислав Буйновский on 18.10.2021.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    
    private let redLightView = UIView()
    private let yellowLightView = UIView()
    private let greenLightView = UIView()
    private let controlButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize:CGSize = UIScreen.main.bounds.size
        let circleWidth = screenSize.width / 4
        
        // MARK: Subviews adding
        view.addSubview(redLightView)
        view.addSubview(yellowLightView)
        view.addSubview(greenLightView)
        view.addSubview(controlButton)
        
        // MARK: Constraints
        redLightView.translatesAutoresizingMaskIntoConstraints = false
        yellowLightView.translatesAutoresizingMaskIntoConstraints = false
        greenLightView.translatesAutoresizingMaskIntoConstraints = false
        controlButton.translatesAutoresizingMaskIntoConstraints = false
        
        let redLightViewConstraints = [
            redLightView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redLightView.widthAnchor.constraint(equalToConstant: circleWidth),
            redLightView.heightAnchor.constraint(equalTo: redLightView.widthAnchor, multiplier: 1.0),
            redLightView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ]
        
        let yellowLightViewConstraints = [
            yellowLightView.centerXAnchor.constraint(equalTo: redLightView.centerXAnchor),
            yellowLightView.widthAnchor.constraint(equalTo: redLightView.widthAnchor),
            yellowLightView.heightAnchor.constraint(equalTo: yellowLightView.widthAnchor, multiplier: 1.0),
            yellowLightView.topAnchor.constraint(equalTo: redLightView.bottomAnchor, constant: 20)
        ]
        
        let greenLightViewConstraints = [
            greenLightView.centerXAnchor.constraint(equalTo: redLightView.centerXAnchor),
            greenLightView.widthAnchor.constraint(equalTo: redLightView.widthAnchor),
            greenLightView.heightAnchor.constraint(equalTo: yellowLightView.widthAnchor, multiplier: 1.0),
            greenLightView.topAnchor.constraint(equalTo: yellowLightView.bottomAnchor, constant: 20)
        ]
        
        let controlButtonConstraints = [
            controlButton.centerXAnchor.constraint(equalTo: redLightView.centerXAnchor),
            controlButton.widthAnchor.constraint(equalTo: redLightView.widthAnchor),
            controlButton.topAnchor.constraint(equalTo: greenLightView.bottomAnchor, constant: 40)
        ]
        
        
        NSLayoutConstraint.activate(redLightViewConstraints)
        NSLayoutConstraint.activate(yellowLightViewConstraints)
        NSLayoutConstraint.activate(greenLightViewConstraints)
        NSLayoutConstraint.activate(controlButtonConstraints)
        
        // MARK: Views setup
        redLightView.layer.cornerRadius = circleWidth / 2
        redLightView.backgroundColor = UIColor.red
        redLightView.alpha = 0.3
        
        yellowLightView.layer.cornerRadius = circleWidth / 2
        yellowLightView.backgroundColor = UIColor.yellow
        yellowLightView.alpha = 0.3
        
        greenLightView.layer.cornerRadius = circleWidth / 2
        greenLightView.backgroundColor = UIColor.green
        greenLightView.alpha = 0.3
        
        controlButton.backgroundColor = UIColor.blue
        controlButton.layer.cornerRadius = 10
        controlButton.setTitle("Start", for: .normal)
        controlButton.addTarget(self, action: #selector(controlButtonPressed), for: .touchUpInside)
        
    }

    @objc
    func controlButtonPressed() {
        controlButton.setTitle("Next", for: .normal)

        switch index {
        case 0:
            redLightView.alpha = 1
            greenLightView.alpha = 0.3
            index += 1
        case 1:
            redLightView.alpha = 0.3
            yellowLightView.alpha = 1
            index += 1
        case 2:
            yellowLightView.alpha = 0.3
            greenLightView.alpha = 1
            index = 0
        default:
            break
        }
    }
    
    override open var shouldAutorotate: Bool {
            return false
    }

}

