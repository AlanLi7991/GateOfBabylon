//
//  GOBCollectionSource.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/13.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBCollectionSource: NSObject {
    
    static let metaData: [[String]] =  [
        ["Sect0 Item0", "Sect0 Item1", "Sect0 Item2", "Sect0 Item3", "Sect0 Item4"],
        ["Sect1 Item0", "Sect1 Item1", "Sect1 Item2", "Sect1 Item3", "Sect1 Item4"],
        ["Sect2 Item0", "Sect2 Item1", "Sect2 Item2", "Sect2 Item3", "Sect2 Item4"],
        ["Sect3 Item0", "Sect3 Item1", "Sect3 Item2", "Sect3 Item3", "Sect3 Item4"],
        ]
    
    typealias itemsChangeComplete = (IndexSet, [IndexPath]) -> Void
    
    var sects: [[String]] = []
    
    
    func reloadItems(_ complete: itemsChangeComplete) {
        sects = GOBCollectionSource.metaData
        complete(IndexSet(), [])
    }
    
    func updateItems(complete: itemsChangeComplete) {
        
        var sectSet = IndexSet()
        var itemIndex = [IndexPath]()
        
        sects.enumerated().forEach { (offset: Int, values: [String]) in
            if (offset == 0) {
                if (values.count > 0) {
                    sects[0][0] = "Update Item"
                    itemIndex.append(IndexPath(item: 0, section: 0))
                }
                if (values.count > 1) {
                    let itemOther = values.count - 1
                    sects[0][itemOther] = "Update Item"
                    itemIndex.append(IndexPath(item: itemOther, section: 0))
                }
            }
            if (offset == 1) {
                sects[1] = values.map { _ in "Updated" }
                sectSet.insert(1)
            }
        }
        complete(sectSet, itemIndex)
    }
    
    func insertItems(complete: itemsChangeComplete) {
        
        guard sects.count > 0 else {
            return
        }
        //Prepare Container
        var sectSet = IndexSet()
        var itemIndex = [IndexPath]()
        //Calculate Change
        let sect1 = Int.random(in: 0..<sects.count)
        let sect2 = Int.random(in: 0..<sects.count)
        let item = Int.random(in: 0..<sects[sect2].count)
        //Change DataSouce
        //Attention!!
        //Sequence is important, casue index dynamic change
        sects.insert(["Insert", "Insert", "Insert"], at: sect1)
        sects[sect2].insert("InsertItem", at: item)
        //Add to Container
        sectSet.insert(sect1)
        itemIndex.append(IndexPath(item: item, section: sect2))
        //Callback Change
        complete(sectSet, itemIndex)
    }
    
    func removeItems(complete: itemsChangeComplete) {
        
        guard sects.count > 0 else {
            return
        }
        //Prepare Container
        var sectSet = IndexSet()
        var itemIndex = [IndexPath]()
        //Calculate Change
        let sect1 = Int.random(in: 0..<sects.count)
        let sect2 = Int.random(in: 0..<sects.count)
        let item = Int.random(in: 0..<sects[sect2].count)
        //Change DataSouce
        //Attention!!
        //Sequence is important, casue index dynamic change
        sects[sect2].remove(at: item)
        sects.remove(at: sect1)
        //Add to Container
        sectSet.insert(sect1)
        itemIndex.append(IndexPath(item: item, section: sect2))
        //Callback Change
        complete(sectSet, itemIndex)
    }
}
