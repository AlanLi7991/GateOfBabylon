//
//  GOBScaleImageController.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/22.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBScaleImageController: UIViewController {

    let imageView: GOBScaleImageView = GOBScaleImageView(frame:UIScreen.main.bounds)
    let action = GOBActionRune()
    let image1 = UIImage(named: "ScaleImage1")
    let image2 = UIImage(named: "ScaleImage2")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(imageView)
        imageView.image = image1
        action.attach(viewController: self)
        
        action.alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        action.alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { [weak self] (it) in
            self?.imageView.reset()
        }))
        action.alert.addAction(UIAlertAction(title: "Replace", style: .default, handler: { [weak self] (it) in
            if self?.imageView.image == self?.image1 {
                self?.imageView.image = self?.image2
            }else {
                self?.imageView.image = self?.image1
            }
        }))
    }
    
    static func rune() -> GOBSampleRune {
        let rune = GOBSampleRune(controller: self)
        rune.decription = "ScaleImage like system app Photos"
        return rune
    }

}
