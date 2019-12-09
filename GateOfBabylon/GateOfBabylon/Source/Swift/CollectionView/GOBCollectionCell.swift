//
//  GOBCollectionCell.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/18.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBCollectionCell: UICollectionViewCell {
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.5
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
