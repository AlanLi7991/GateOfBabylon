//
//  StorePhotosController.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/24.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit
import Photos

class GOBStorePhotosController: UIViewController {
    
    let text = UILabel(frame: CGRect.zero)
    let action = GOBActionRune()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            text.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            text.heightAnchor.constraint(equalToConstant: 50)
            ])
        text.textColor = UIColor.black
        
        action.attach(viewController: self)
        
        action.alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        action.alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [weak self] (it) in
            self?.createImage()
        }))
        
        action.alert.addAction(UIAlertAction(title: "Store", style: .default, handler: { [weak self] (it) in
            self?.storeImage()
        }))

    }
    
    func createImage() {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            text.text = "Not found document folder"
            return
        }
        if FileManager.default.fileExists(atPath: path + "/StorePhotosController.png") {
            try? FileManager.default.removeItem(atPath: path+"/StorePhotosController.png")
        }
        guard let image = UIImage(named: "ScaleImage1")?.pngData() else {
            text.text = "Image not found"
            return
        }
        let res = FileManager.default.createFile(atPath: path+"/StorePhotosController.png", contents: image, attributes: nil)
        if (!res) {
            text.text = "Store image to dcoument failure"
        }
    }
    
    func storeImage() {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            text.text = "Not found document folder"
            return
        }
        PHPhotoLibrary.shared().performChanges({
            let url = NSURL.fileURL(withPath: path+"/StorePhotosController.png");
            PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: url)
        }) { [weak self](success, err) in
            DispatchQueue.main.async {
                if (success) {
                    self?.text.text = "Store image success"
                }else {
                    self?.text.text = "Store image \(err.debugDescription)"
                }
            }
        }
        
    }
    
    func deleteImage() {
        
    }

    static func rune() -> GOBSampleRune {
        let rune = GOBSampleRune(controller: self)
        rune.decription = "Save image file to Photos"
        return rune
    }
    
}
