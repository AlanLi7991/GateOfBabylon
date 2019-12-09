//
//  GOBInformationSect.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/24.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBInformationSect: NSObject {
    
    let title: String
    let items: [GOBInformationItem]
    
    required init(title: String, items: [GOBInformationItem]) {
        self.title = title
        self.items = items
        super.init()
    }
    
    static func defaultSects() -> [GOBInformationSect] {
        return [
            codeSect(),
        ]
    }
    
    static func codeSect() -> GOBInformationSect {
        return GOBInformationSect(title: "Code", items: [
                GOBSimulatorCheckItem(),
                GOBLinkCallObjectItem(),
            ])
    }
    
    
}


