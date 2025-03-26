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
        view.addSubview(contentLabel)
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = item.answer
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    init(frame: CGRect = .zero, item: QuizAnswer, selected: @escaping (QuizAnswer) -> Void) {
        self.item = item
        self.selected = selected
        
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        restorationIdentifier = item.id // uygulama kapansa bile belirli bir bileşeni tanımlamak ve geri yüklemek için kullanılır
        addSubview(contentView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectAnswer(){
        selected(item)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
}
