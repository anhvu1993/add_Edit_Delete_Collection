//
//  ViewController.swift
//  ThemSuaXoaColectionView
//
//  Created by Mac on 3/8/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, CollectionDelegate {
    var listMacOs = [MacOs]()
    override func viewDidLoad() {
        super.viewDidLoad()
        listMacOs =
            [MacOs(name: "MAC 001", imageData: (UIImage(named: "1")?.pngData())!),
             MacOs(name: "MAC 002", imageData: (UIImage(named: "2")?.pngData())!),
             MacOs(name: "MAC 003", imageData: (UIImage(named: "3")?.pngData())!),
             MacOs(name: "MAC 004", imageData: (UIImage(named: "4")?.pngData())!),
             MacOs(name: "MAC 005", imageData: (UIImage(named: "5")?.pngData())!),
             MacOs(name: "MAC 006", imageData: (UIImage(named: "1")?.pngData())!),
             MacOs(name: "MAC 007", imageData: (UIImage(named: "2")?.pngData())!),
             MacOs(name: "MAC 008", imageData: (UIImage(named: "3")?.pngData())!),
             MacOs(name: "MAC 009", imageData: (UIImage(named: "4")?.pngData())!),
             MacOs(name: "MAC 010", imageData: (UIImage(named: "5")?.pngData())!)
        ]
    }
//    delegate
    func deleteDelegate(at inDexPath: IndexPath) {
        listMacOs.remove(at: inDexPath.row)
        collectionView.reloadData()
    }
    
    
    
    @IBAction func unwindToCollectionview(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source as! ToolViewController
        guard let indexPaths = collectionView.indexPathsForSelectedItems else { return }
            if indexPaths.count != 0 {
                for indexPath in indexPaths {
                    listMacOs[indexPath.item].name      = source.textField.text
                    listMacOs[indexPath.item].imageData = source.image?.pngData()!
                }
            }else {
                let macOs  = MacOs(name: source.textField.text! , imageData: ((source.image?.pngData())!))
                listMacOs.insert(macOs, at: 0)
                collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])
            }
        
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Detail":
            guard let detailsViewController = segue.destination as? DetailViewController else {return }
            if let indexPath    = collectionView.indexPathsForSelectedItems {
                let item        = indexPath.first?.row
                let data        = listMacOs[item!]
                detailsViewController.photos     = data.imageData
                detailsViewController.textString = data.name
            }
        case "Edit":
            //            guard let toolViewController = segue.destination as? ToolViewController else {return}
            //            if let indexPath1 = collectionView.indexPathsForSelectedItems {
            //                let item1 = indexPath1.first?.row
            //                let data1 = listMacOs[item1!]
            //                toolViewController.textFields = data1.name
            //            }
            print("hello")
            
        default:
            print("...")
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMacOs.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        
        let detailMacOs      = listMacOs[indexPath.item]
        cell.text_label.text = detailMacOs.name
        cell.image.image     = UIImage(data: detailMacOs.imageData!)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //            listMacOs.remove(at: indexPath.row)
        //            collectionView.deleteItems(at: [indexPath])
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "viewHeader", for: indexPath)
            return view
        }
        fatalError("loi data")
    }
    
}

