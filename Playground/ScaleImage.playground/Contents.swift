//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class ScaleImage: UIScrollView {
    
    var renderSize: CGSize = CGSize.zero {
        didSet {
            self.adjustContent()
        }
    }
    
    var render = UIImageView(frame: CGRect.zero)
    
    var image: UIImage? {
        didSet {
            if let image = self.image {
                self.render.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
                self.render.image = image
                self.renderSize = image.size
            }
        }
    }
    
    func adjustContent() {
        self.contentSize = renderSize
        let topGap = (self.bounds.size.height - renderSize.height)/2
        let leftGap = (self.bounds.size.width - renderSize.width)/2
        self.contentInset = UIEdgeInsets(top: topGap, left: leftGap, bottom: 0, right: 0)
    }
    
    func reset() {
        self.zoomScale = 1.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(render)
        self.maximumZoomScale = 2.0
        self.minimumZoomScale = 0.75
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class MyViewController : UIViewController {
    
    var imageScale: ScaleImage?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let image = UIImage(named: "lover.png")
        
        let scale = ScaleImage(frame:CGRect(x: 0, y: 0, width: 375, height: 680))
        scale.image = image
        scale.backgroundColor = .gray
        view.addSubview(scale)
        
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        view.addSubview(button)
    
        self.imageScale = scale
        self.view = view
    }
    
    @objc func reset()  {
        self.imageScale?.reset()
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
