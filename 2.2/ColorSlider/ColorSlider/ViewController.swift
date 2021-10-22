//
//  ViewController.swift
//  ColorSlider
//
//  Created by Станислав Буйновский on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {

    private let redSliderView = UISlider()
    private let greenSliderView = UISlider()
    private let blueSliderView = UISlider()
    private let appTitleLabel = UILabel()
    private let redSliderLabel = UILabel()
    private let greenSliderLabel = UILabel()
    private let blueSliderLabel = UILabel()
    
    private var tempRed: CGFloat {
        CGFloat(redSliderView.value)
    }
    private var tempGreen: CGFloat {
        CGFloat(greenSliderView.value)
    }
    private var tempBlue: CGFloat {
        CGFloat(blueSliderView.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sliders = [
            redSliderView,
            greenSliderView,
            blueSliderView
        ]
        let labels = [
            redSliderLabel,
            greenSliderLabel,
            blueSliderLabel
        ]
        
        // MARK: Subview adding
        view.addSubview(appTitleLabel)
        view.addSubview(redSliderView)
        view.addSubview(redSliderLabel)
        view.addSubview(greenSliderView)
        view.addSubview(greenSliderLabel)
        view.addSubview(blueSliderView)
        view.addSubview(blueSliderLabel)
        
        // MARK: Constraints
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        redSliderView.translatesAutoresizingMaskIntoConstraints = false
        greenSliderView.translatesAutoresizingMaskIntoConstraints = false
        blueSliderView.translatesAutoresizingMaskIntoConstraints = false
        redSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        greenSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        blueSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let appTitleConstraints = [
            appTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 20)
        ]
        
        let redSliderViewConstraints = [
            redSliderView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor,
                                               constant: 20),
            redSliderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSliderView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                 multiplier: 0.8)
        ]
        
        let redSliderLabelConstraints = [
            redSliderLabel.topAnchor.constraint(equalTo: redSliderView.bottomAnchor,
                                               constant: 10),
            redSliderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let greenSliderViewConstraints = [
            greenSliderView.topAnchor.constraint(equalTo: redSliderLabel.topAnchor,
                                                 constant: 40),
            greenSliderView.widthAnchor.constraint(equalTo: redSliderView.widthAnchor),
            greenSliderView.centerXAnchor.constraint(equalTo: redSliderView.centerXAnchor)
        ]
        
        let greenSliderLabelConstraints = [
            greenSliderLabel.topAnchor.constraint(equalTo: greenSliderView.bottomAnchor,
                                               constant: 10),
            greenSliderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        let blueSliderViewConstraints = [
            blueSliderView.topAnchor.constraint(equalTo: greenSliderLabel.topAnchor,
                                                constant: 40),
            blueSliderView.widthAnchor.constraint(equalTo: redSliderView.widthAnchor),
            blueSliderView.centerXAnchor.constraint(equalTo: redSliderView.centerXAnchor)
        ]
        
        let blueSliderLabelConstraints = [
            blueSliderLabel.topAnchor.constraint(equalTo: blueSliderView.bottomAnchor,
                                               constant: 10),
            blueSliderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(appTitleConstraints)
        NSLayoutConstraint.activate(redSliderViewConstraints)
        NSLayoutConstraint.activate(redSliderLabelConstraints)
        NSLayoutConstraint.activate(greenSliderViewConstraints)
        NSLayoutConstraint.activate(greenSliderLabelConstraints)
        NSLayoutConstraint.activate(blueSliderViewConstraints)
        NSLayoutConstraint.activate(blueSliderLabelConstraints)
        
        
        // MARK: Views config
        appTitleLabel.text = "Background changer"
        appTitleLabel.font = UIFont(name: "Helvetica", size: 30)
        
        
        redSliderView.minimumValue = 0
        redSliderView.maximumValue = 255
        greenSliderView.minimumValue = 0
        greenSliderView.maximumValue = 255
        blueSliderView.minimumValue = 0
        blueSliderView.maximumValue = 255
        
        redSliderView.minimumTrackTintColor = .red
        redSliderView.thumbTintColor = .red
        greenSliderView.minimumTrackTintColor = .green
        greenSliderView.thumbTintColor = .green
        blueSliderView.minimumTrackTintColor = .blue
        blueSliderView.thumbTintColor = .blue
        
        for slider in sliders {
            slider.value = redSliderView.maximumValue / 2
            slider.addTarget(self,
                              action: #selector(setColors),
                              for: .valueChanged)
        }
        
        for label in labels {
            label.text = String.localizedStringWithFormat("%.0F", Double(tempRed))
            label.font = UIFont(name: "Helvetica", size: 20)
        }

    }
    
    // MARK: Sliders action
    @objc
    func setColors() {
        
        redSliderLabel.text = String.localizedStringWithFormat("%.0F", Double(tempRed))
        greenSliderLabel.text = String.localizedStringWithFormat("%.0F", Double(tempGreen))
        blueSliderLabel.text = String.localizedStringWithFormat("%.0F", Double(tempBlue))
        
        view.backgroundColor = UIColor(
            cgColor: CGColor(red: (tempRed/255),
                             green: (tempGreen/255),
                             blue: (tempBlue/255),
                             alpha: 1.0))
        
        appTitleLabel.textColor = UIColor(
            cgColor: CGColor(red: ((255 - tempRed)/255),
                             green: ((255 - tempGreen)/255),
                             blue: ((255 - tempBlue)/255),
                             alpha: 1.0))
        
        redSliderLabel.textColor = UIColor(
            cgColor: CGColor(red: ((255 - tempRed)/255),
                             green: ((255 - tempGreen)/255),
                             blue: ((255 - tempBlue)/255),
                             alpha: 1.0))
        
        greenSliderLabel.textColor = UIColor(
            cgColor: CGColor(red: ((255 - tempRed)/255),
                             green: ((255 - tempGreen)/255),
                             blue: ((255 - tempBlue)/255),
                             alpha: 1.0))
        
        blueSliderLabel.textColor = UIColor(
            cgColor: CGColor(red: ((255 - tempRed)/255),
                             green: ((255 - tempGreen)/255),
                             blue: ((255 - tempBlue)/255),
                             alpha: 1.0))
    }


}

