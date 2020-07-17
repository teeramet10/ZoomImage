//
//  ViewController.swift
//  RotateImage
//
//  Created by Teeramet on 18/6/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.autoresizingMask = [.flexibleBottomMargin,.flexibleLeftMargin,.flexibleRightMargin,.flexibleLeftMargin]
        scrollView.contentSize = container.bounds.size
        scrollView.isPagingEnabled = true
        scrollView.bouncesZoom = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = false
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
               scrollView.maximumZoomScale = 4.0
               scrollView.zoomScale = 1.0
    }


    override func viewDidLayoutSubviews() {
        scrollView.zoomScale = 1.0
    }
    
    private func centerImage() {
        let imageViewSize = container.frame.size
        let scrollViewSize = scrollView.frame.size
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 1
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 1
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
}


extension ViewController : UIScrollViewDelegate{
      func viewForZooming(in scrollView: UIScrollView) -> UIView? {
          return  self.container
      }
      
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
