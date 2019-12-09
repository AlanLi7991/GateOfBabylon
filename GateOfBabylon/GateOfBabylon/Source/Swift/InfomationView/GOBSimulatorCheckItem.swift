//
//  GOBSimulatorCheckItem.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/24.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBSimulatorCheckItem: GOBInformationItem {

    convenience init() {
        var title = "Current OS: "
        var detail = "arch is "
        
        #if arch(x86_64)
        title += "Simulator"
        detail += "x86_64"
        #elseif arch(arm64)
        title += "Device"
        detail += "arm64"
        #else
        title += "Unknow"
        detail += "not x86_64 or arm64"
        #endif
        
        self.init(title: title, detail: detail)

    }
}
