//
//  ViewController.swift
//  Trafficlights
//
//  Created by Станислав Буйновский on 18.10.2021.
//

import UIKit

class ViewController: UIViewController {
    var lightsViews: [UIView] = []
    var index = 0
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var controlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLightView.layer.cornerRadius = 70
        yellowLightView.layer.cornerRadius = 70
        greenLightView.layer.cornerRadius = 70
        redLightView.alpha = 0.3
        yellowLightView.alpha = 0.3
        greenLightView.alpha = 0.3
        controlButton.setTitle("Start", for: .normal)
        controlButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        lightsViews = [redLightView, yellowLightView, greenLightView]
        
    }

    @IBAction func lightsButtonChange(_ sender: UIButton) {
        sender.setTitle("Next", for: .normal)
        
        switch index {
        case 0:
            lightsViews[index].alpha = 1
            lightsViews.last?.alpha = 0.3
            index += 1
        case 1:
            lightsViews[index].alpha = 1
            lightsViews[index - 1].alpha = 0.3
            index += 1
        case 2:
            lightsViews[index].alpha = 1
            lightsViews[index - 1].alpha = 0.3
            index = 0
        default:
            break
        }
    }
    
    override open var shouldAutorotate: Bool {
            return false
    }

}

