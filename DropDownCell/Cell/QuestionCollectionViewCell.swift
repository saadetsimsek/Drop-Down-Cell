//
//  QuestionCollectionViewCell.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 25/03/2025.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "QuestionCollectionViewCell"
    
    lazy var cellHeader : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        return image
    }()
    
    lazy var cellContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(itemStackView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itemStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 9
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        clipsToBounds = true
        layer.cornerRadius = 20
        
        contentView.addSubview(cellHeader)
        contentView.addSubview(cellContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
