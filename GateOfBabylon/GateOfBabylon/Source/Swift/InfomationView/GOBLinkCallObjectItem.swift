//
//  GOBLinkCallObjectItem.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/9/9.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBLinkCallObjectItem: GOBInformationItem {

    convenience init() {
        let title = "Link Call Message: "
        let detail = GOBLinkCallObject.linkCallSample();
        
        self.init(title: title, detail: detail)
        
    }
    
}
