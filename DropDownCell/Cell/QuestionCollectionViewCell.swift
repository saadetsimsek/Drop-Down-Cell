//
//  QuestionCollectionViewCell.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 25/03/2025.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "QuestionCollectionViewCell"
    
    var selectAnswer: ((String) -> Void)?
    
    private var stackBottomAnchor: NSLayoutConstraint?
    
    var quiz: Quiz? = nil {
        willSet {
            
            newValue?.answers.forEach { item in
                itemStackView.addArrangedSubview(oneQuestionItemF(item: item))
            }
            
            questionLabel.text = newValue?.questionText
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateCell()
        }
    }
    
    lazy var cellHeader : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        view.addSubview(checkImage)
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 46).isActive = true
        image.heightAnchor.constraint(equalToConstant: 46).isActive = true
        image.image = .check0
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var cellContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(itemStackView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapContent)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itemStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 9
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        clipsToBounds = true
        layer.cornerRadius = 20
        
        contentView.addSubview(cellHeader)
        contentView.addSubview(cellContent)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapContent(){
        
    }
    
    //Updates the interface based on the selected answer
    private func oneQuestionItemF(item: QuizAnswer) -> UIView {
        OneQuestionItem(item: item) {[weak self] answer in
            guard let self = self else { return }
            self.selectAnswer?(answer.answer)
            
            self.itemStackView.arrangedSubviews.forEach{ view in
                guard let selectedView = view as? OneQuestionItem else {
                    return
                }
                selectedView.contentView.backgroundColor = selectedView.restorationIdentifier == answer.id ? .systemBlue : .systemGray
                
                selectedView.contentLabel.textColor = selectedView.restorationIdentifier == answer.id ? .white : .black
                
            }
            checkImage.image = .check1
        }
    }
    
    private func updateCell(){
        stackBottomAnchor?.isActive = isSelected
        
    }
    
    func setConstraints(){
        
        stackBottomAnchor =      itemStackView.bottomAnchor.constraint(equalTo: cellContent.bottomAnchor, constant: -10)
        stackBottomAnchor?.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            cellHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellHeader.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            
            checkImage.centerYAnchor.constraint(equalTo: cellHeader.centerYAnchor),
            checkImage.leadingAnchor.constraint(equalTo: cellHeader.leadingAnchor, constant: 15),
            
            questionLabel.topAnchor.constraint(equalTo: cellHeader.topAnchor, constant: 15),
            questionLabel.bottomAnchor.constraint(equalTo: cellHeader.bottomAnchor, constant: -15),
            questionLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: cellHeader.trailingAnchor, constant: -30),
            
            cellContent.topAnchor.constraint(equalTo: cellHeader.bottomAnchor),
            cellContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            itemStackView.topAnchor.constraint(equalTo: cellContent.topAnchor, constant: 10),
            itemStackView.leadingAnchor.constraint(equalTo: cellContent.leadingAnchor, constant: 15),
            itemStackView.trailingAnchor.constraint(equalTo: cellContent.trailingAnchor, constant: -15),
       
            
        ])
    }
}

