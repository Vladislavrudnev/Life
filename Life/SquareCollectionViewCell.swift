//
//  SquareCollectionViewCell.swift
//  Life
//
//  Created by владислав Руднев on 24.07.2022.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var squareView: UIView!

    override func layoutSubviews() {
        super.layoutSubviews()
        squareView.layer.cornerRadius = squareView.bounds.size.width/2
    }
    
    func configureWithState(_ isAlive: Bool) {
        self.squareView.backgroundColor = isAlive ?  UIColor.systemMint : UIColor.purple
    }
}
