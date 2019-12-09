//
//  GOBViewControllerWrapper.swift
//  GateOfBabylon
//
//  Created by zhuojia on 2019/12/09.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import SwiftUI

struct GOBViewControllerWrapper: UIViewControllerRepresentable {

    let clazz: UIViewController.Type
    
    init(type: UIViewController.Type) {
        clazz = type
    }
    
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<GOBViewControllerWrapper>) -> UIViewController {
        let result = clazz.init()
        return result
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<GOBViewControllerWrapper>) {
        
    }
    
    
}

