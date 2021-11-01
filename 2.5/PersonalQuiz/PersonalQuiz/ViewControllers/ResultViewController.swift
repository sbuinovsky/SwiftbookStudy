//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        var typesCounter: [AnimalType : Int] = [:]
        
        answers.forEach {
            if let currentValue = typesCounter[$0.type] {
                typesCounter.updateValue(currentValue + 1, forKey: $0.type)
            } else {
                typesCounter.updateValue(1, forKey: $0.type)
            }
        }
        
        guard let commonAnimalType = (typesCounter.sorted() {
            $0.value > $1.value
        }).first else { return }
        
        animalLabel.text = "\(commonAnimalType.key) - \(commonAnimalType.key.rawValue)"
        animalDescription.text = commonAnimalType.key.definition
    }
}
