//
//  CategoryCollectionViewCell.swift
//  My CT Store
//
//  Created by Arpit Thummaer on 29/03/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setCorner(radius: 4)
    }
}
