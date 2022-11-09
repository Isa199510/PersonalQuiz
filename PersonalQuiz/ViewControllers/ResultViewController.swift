//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var results: [Answer] = []
    var animals: [AnimalType: Int] = [:]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}

extension ResultViewController {
    func updateResult() {
        for result in results {
            animals[result.type] = (animals[result.type] ?? 0) + 1
        }
        
        let maxCountAnimal = animals.max { $0.value < $1.value }
        guard let animal = maxCountAnimal?.key else { return }
        
        animalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
}
