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
    
    lazy var cellContent: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellHeader)
        clipsToBounds = true
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
