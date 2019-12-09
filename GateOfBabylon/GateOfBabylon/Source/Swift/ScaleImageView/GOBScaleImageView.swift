//
//  GOBScaleImageView.swift
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/2/22.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

import UIKit

class GOBScaleImageView: UIScrollView, UIScrollViewDelegate {
    
    var renderSize: CGSize = CGSize.zero {
        didSet {
            contentSize = renderSize
            render.frame.size = renderSize
            resizeContent()
        }
    }
    
    var render = UIImageView(frame: CGRect.zero)
    
    var image: UIImage? {
        didSet {
            guard let img = image else {
                return
            }
            var imgSize = img.size
            let imgRect = CGRect(origin: frame.origin, size: imgSize)
            if !frame.contains(imgRect) {
                imgSize = frame.intersection(imgRect).size
            }
            renderSize = CGSize(width: imgSize.width*zoomScale, height: imgSize.height*zoomScale)
            render.image = img
        }
    }
    
    
    func resizeContent() {
        let heightGap = max((self.frame.size.height - self.contentSize.height)/2, 0)
        let widthGap = max((self.frame.size.width - self.contentSize.width)/2, 0)
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.contentInset = UIEdgeInsets(top: heightGap, left: widthGap, bottom: heightGap, right: widthGap)
        }
    }
    
    func reset() {
        zoomScale = 1.0
        resizeContent()
    }
    
    //-----------------------------------------------------------------------------
    //MARK: Delegate
    //-----------------------------------------------------------------------------
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.render;
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        resizeContent()
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        resizeContent()
    }
    
    //-----------------------------------------------------------------------------
    //MARK: Init Override
    //-----------------------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        maximumZoomScale = 10.0
        minimumZoomScale = 1.0
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        bounces = false
        contentInsetAdjustmentBehavior = .never
        
        addSubview(render)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
