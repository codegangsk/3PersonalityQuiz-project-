//
//  ResultsViewController.swift
//  3PersonalityQuiz(project)
//
//  Created by Sophie Kim on 2020/08/20.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
}

extension ResultsViewController {
    func calculatePersonalityResult() {
         var frequencyOfAnswers: [AnimalType: Int] = [:]
         let responseTypes = responses.map { $0.type }
         
         for response in responseTypes {
             let newCount: Int
         
             if let oldCount = frequencyOfAnswers[response] {
                 newCount = oldCount + 1
             } else {
                 newCount = 1
             }
             frequencyOfAnswers[response] = newCount
         }
         
         let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
         let mostCommonAnswer = frequentAnswersSorted.sorted{$0.1>$1.1}.first!.key
         
         resultAnswerLabel.text = "you are a \(mostCommonAnswer.rawValue)"
         resultDefinitionLabel.text = mostCommonAnswer.definition
     }
}
