//
//  GOBActionController.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/16.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit


class GOBActionRune: NSObject {
    
    typealias TouchButton = (UIButton) -> Void

    let button = UIButton(type: UIButton.ButtonType.system)
    let alert = UIAlertController(title: "Action", message: nil, preferredStyle: .actionSheet)
    private var touchUpInsideButton: TouchButton? = nil
    
    override init() {
        super.init();
        button.setTitle("Action", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderColor = button.tintColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 35
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    }
    
    func attach(view: UIView) {
        view.addSubview(button)
        view.bringSubviewToFront(button)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -15),
            button.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -15),
            button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 70),
            ])
    }
    
    func attach(viewController controller: UIViewController) {
        attach(view: controller.view)
        touchUpInsideButton = { [weak controller, unowned self] button in
            controller?.present(self.alert, animated: true, completion: nil)
        }
    }
    
    //-----------------------------------------------------------------------------
    //MARK: Action
    //-----------------------------------------------------------------------------
    
    @objc func touchUpInsideAction(button: UIButton) {
        touchUpInsideButton?(button)
    }
    
    func setAction(callback: @escaping TouchButton) {
        touchUpInsideButton = callback;
    }
    
    
}
