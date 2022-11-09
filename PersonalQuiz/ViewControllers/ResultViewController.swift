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
    var counts: [AnimalType: Int] = [:]
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension ResultViewController {
    func updateResult() {
        for result in results {
            counts[result.type] = (counts[result.type] ?? 0) + 1
        }
        
        let maxAnimal = counts.max { $0.value < $1.value }
        
        guard let animal = maxAnimal?.key.rawValue,
              let defination = maxAnimal?.key.definition else { return }
        
        animalLabel.text = "Вы - \(animal)"
        definitionLabel.text = defination
    }
}
