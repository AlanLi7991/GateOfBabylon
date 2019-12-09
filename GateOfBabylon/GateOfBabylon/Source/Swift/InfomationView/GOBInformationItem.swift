//
//  GOBInformationRune.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/24.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBInformationItem: NSObject {

    var title: String
    var detail: String
    
    required init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
    
}
