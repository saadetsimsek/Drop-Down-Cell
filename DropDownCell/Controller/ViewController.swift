//
//  ViewController.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 14/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let question = Quiz.mockData()
    
    private let sizingCell = QuestionCollectionViewCell()
    
    private var selectedAnswers: [String: String] = [:]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: QuestionCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true // birden fazla öğenin aynı anda seçilmesine izin verir.
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(collectionView)
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return question.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCollectionViewCell.identifier, for: indexPath) as? QuestionCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.quiz = question[indexPath.item]
        cell.selectAnswer = { [weak self] in
            guard let self = self else {return}
            let questionText = question[indexPath.item].questionText
            self.selectedAnswers[questionText] = $0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath,
                                  animated: true,
                                  scrollPosition: [])
        collectionView.performBatchUpdates(nil)
        
        print(selectedAnswers)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sizingCell.systemLayoutSizeFitting(CGSize(width: view.frame.width - 60,
                                                             height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority:.defaultLow)
        return size
    }
    
}
