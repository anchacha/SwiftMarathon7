//
//  ViewController.swift
//  SwiftMarathon7
//
//  Created by Anton Charny on 20/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView = UIScrollView(frame: self.view.bounds)
    private lazy var imageView = UIImageView(image: UIImage(named: "header-image.jpg"))
    
    private let imageOriginalHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = .init(width: view.bounds.width,
                                       height: view.bounds.height + imageOriginalHeight)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.backgroundColor = .purple
        view.addSubview(scrollView)
        
        imageView.contentMode = .scaleAspectFill
        imageView.frame = .init(origin: .zero, size: .init(width: self.view.bounds.size.width,
                                                           height: imageOriginalHeight))
        imageView.clipsToBounds = true
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = imageOriginalHeight - scrollView.contentOffset.y
        imageView.frame = .init(x: 0, y: scrollView.contentOffset.y, width: self.view.bounds.width, height: height)
        if height > 0 {
            scrollView.showsVerticalScrollIndicator = true
            let indicatorInset = max(height, imageOriginalHeight) - view.safeAreaInsets.top
            scrollView.verticalScrollIndicatorInsets = .init(top: indicatorInset,
                                                             left: 0,
                                                             bottom: 0,
                                                             right: 0)
        } else {
            scrollView.showsVerticalScrollIndicator = false
        }
        
        print(height)
        print(scrollView.contentOffset.y)
    }
}
