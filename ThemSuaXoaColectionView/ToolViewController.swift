//
//  ToolViewController.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class ToolViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imagePhoto: UIImageView!
    var textFields:String?
    var dataImage:Data?
    var image: UIImage? {
        didSet {
            imagePhoto.image = image
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if textField != nil, dataImage != nil {
            textField.text = textFields
            imagePhoto.image = UIImage(data: dataImage!)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if image != nil, textField.text != ""  {
            return true
        }
        let alert = UIAlertController(title: "Thông báo", message: "Vui lòng nhập name and photo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return false
    }
    @IBAction func tap(_ sender: Any) {
        let imagepickerControllerDeleget = UIImagePickerController()
        imagepickerControllerDeleget.sourceType = .photoLibrary
        imagepickerControllerDeleget.delegate = self
        present(imagepickerControllerDeleget, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
