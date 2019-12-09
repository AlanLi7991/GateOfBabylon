//
//  GOBCollectionController.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/13.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBCollectionController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let source = GOBCollectionSource()
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    let action = GOBActionRune()
    
    override func viewDidLoad() {
        
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        collection.backgroundColor = UIColor.white
        collection.setCollectionViewLayout(layout, animated: false)
        collection.dataSource = self
        collection.delegate = self
        collection.register(GOBCollectionCell.classForCoder(), forCellWithReuseIdentifier: "IDENTIFIER")
        
        view.backgroundColor = UIColor.white
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: guide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            collection.leftAnchor.constraint(equalTo: guide.leftAnchor),
            collection.rightAnchor.constraint(equalTo: guide.rightAnchor),
            ])
        
        action.attach(view: view)
        action.setAction { [unowned self] _ in
            self.present(self.action.alert, animated: true, completion: nil)
        }
        
        let reload = UIAlertAction(title: "Reload", style: .default) { [unowned self] _ in
            self.source.reloadItems { _, _ in self.collection.reloadData() }
            self.collection.reloadData()
        }
        
        let update = UIAlertAction(title: "Update", style: .default) { [unowned self] _ in
            self.source.updateItems { (sect, items) in
                self.collection.reloadSections(sect)
                self.collection.reloadItems(at: items)
            }
        }
        
        let insert = UIAlertAction(title: "Insert", style: .default) { [unowned self] _ in
            self.source.insertItems(complete: { [unowned self] (sect, items) in
                self.collection.performBatchUpdates({
                    self.collection.insertSections(sect)
                    self.collection.insertItems(at: items)
                }, completion: nil)
            })
        }
        
        let crashDelete = UIAlertAction(title: "Crash", style: .default) { [unowned self] _ in
            self.source.removeItems(complete: { [unowned self] (sect, items) in
                self.collection.deleteSections(sect)
                self.collection.deleteItems(at: items)
            })
        }
        
        let delete = UIAlertAction(title: "Delete", style: .default) { [unowned self] _ in
            self.source.removeItems(complete: { [unowned self] (sect, items) in
                self.collection.performBatchUpdates({
                    self.collection.deleteSections(sect)
                    self.collection.deleteItems(at: items)
                }, completion: nil)

            })
        }
        
        action.alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        action.alert.addAction(reload)
        action.alert.addAction(update)
        action.alert.addAction(insert)
        action.alert.addAction(delete)
        action.alert.addAction(crashDelete)
    }
    
    //-----------------------------------------------------------------------------
    //MARK: Collection DataSource
    //-----------------------------------------------------------------------------
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return source.sects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.sects[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IDENTIFIER", for: indexPath) as! GOBCollectionCell
        cell.label.text = source.sects[indexPath.section][indexPath.item]
        return cell
    }
    
    
    static func rune() -> GOBSampleRune {
        let rune = GOBSampleRune(controller: self)
        rune.decription = "Sample for why UICollectionView crashes"
        return rune
    }
}
