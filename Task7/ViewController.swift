//
//  ViewController.swift
//  Task7
//
//  Created by va-gusev on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .secondarySystemBackground
        
        scrollView.frame = view.bounds
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height + 270 + 300)
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.addSubview(imageView)
        
        imageView.image = UIImage(named: "pic")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame = .init(origin: .zero, size: .init(width: view.bounds.width, height: 270))
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < 0 {
            imageView.frame = .init(x: 0,
                                    y: offset,
                                    width: view.bounds.width,
                                    height: 270 - offset)
            scrollView.verticalScrollIndicatorInsets = .init(top: 270 - offset - view.layoutMargins.top,
                                                             left: 0,
                                                             bottom: 0,
                                                             right: 0)
        }
    }
}
