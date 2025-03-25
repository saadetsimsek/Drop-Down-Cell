//
//  OneQuestionItem.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 25/03/2025.
//

import UIKit

final class OneQuestionItem: UIView {
    var item: QuizAnswer
    var selected: (QuizAnswer) -> ()
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectAnswer))
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(tapGesture)
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        return view
    }()
    
    
    init(frame: CGRect = .zero, item: QuizAnswer, selected: @escaping (QuizAnswer) -> Void) {
        self.item = item
        self.selected = selected
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectAnswer(){
        selected(item)
    }
}
