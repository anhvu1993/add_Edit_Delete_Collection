//
//  CollectionViewCell.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
protocol CollectionDelegate {
    func deleteDelegate (at inDexPath: IndexPath)
}
class CollectionViewCell: UICollectionViewCell {
    
    var delegate: CollectionDelegate?
    var indexPath:IndexPath?
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var text_label: UILabel!
    override func prepareForReuse() {
        text_label.text = ""
        image.image = nil
    }
    @IBAction func xoa(_ sender: Any) {
        if indexPath != nil {
            delegate?.deleteDelegate(at: indexPath!)
        }
        
    }
}
