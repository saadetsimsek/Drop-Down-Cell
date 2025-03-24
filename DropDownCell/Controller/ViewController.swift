//
//  ViewController.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 14/03/2025.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        $0.register(DropDownCell.self, forCellWithReuseIdentifier: "DropDownCell")
        $0.delegate = self
        $0.dataSource = self
        
        return layout
    }(UICollectionView(frame: view.bounds,
                       collectionViewLayout: UICollectionViewFlowLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

