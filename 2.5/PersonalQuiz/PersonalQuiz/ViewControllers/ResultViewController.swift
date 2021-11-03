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
        
        let typesCounter = countAnimals(for: answers)
        guard let animalType = getCommonAnimal(for: typesCounter) else { return }
        
        animalLabel.text = "\(animalType) - \(animalType.rawValue)"
        animalDescription.text = animalType.definition
    }
    
    //MARK: - Private methods
    private func countAnimals(for answers: [Answer]) -> [AnimalType : Int] {
        var counter: [AnimalType : Int] = [:]
        
        answers.forEach {
            if let currentValue = counter[$0.type] {
                counter.updateValue(currentValue + 1, forKey: $0.type)
            } else {
                counter.updateValue(1, forKey: $0.type)
            }
        }
        return counter
    }
    
    private func getCommonAnimal(for typesCounter: [AnimalType : Int]) -> AnimalType? {
        
        let sortedAnimals = typesCounter.sorted {
            $0.value > $1.value
        }
        
        let animalType = sortedAnimals.first?.key
        
        return animalType
    }
}
