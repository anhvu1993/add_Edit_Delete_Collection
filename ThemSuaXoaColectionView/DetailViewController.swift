//
//  DetailViewController.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var photos:Data!
    var textString:String?
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if photos != nil {
            photo.image = UIImage(data: photos)
            name.text   = textString
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detinastion = segue.destination as? ToolViewController {
            detinastion.textFields = name.text
            detinastion.dataImage  = photo.image?.pngData()
        }
        
    }
    
    
}
