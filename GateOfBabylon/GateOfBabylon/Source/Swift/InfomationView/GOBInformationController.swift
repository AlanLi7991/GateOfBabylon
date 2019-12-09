//
//  GOBInformationController.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/24.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBInformationController: UITableViewController {
    
    let sects: [GOBInformationSect] = GOBInformationSect.defaultSects()
    
    convenience init() {
        self.init(style: .plain)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sects.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sects[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Controller")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Controller")
        }
        cell?.textLabel?.text = sects[indexPath.section].items[indexPath.row].title
        cell?.detailTextLabel?.text = sects[indexPath.section].items[indexPath.row].detail
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sects[section].title
    }
    
    static func rune() -> GOBSampleRune {
        let rune = GOBSampleRune(controller: self)
        rune.decription = "Show some information about this app & device"
        return rune
    }
    

}
