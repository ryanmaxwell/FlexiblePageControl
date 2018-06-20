//
//  ViewController.swift
//  Demo
//
//  Created by 島仁誠 on 2017/04/04.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollSize: CGFloat = 300
    let numberOfPages: Int = 7
    let startPage: Int = 5
    let displayCount: Int = 5

    let pageControl1 = FlexiblePageControl()
    let pageControl2 = FlexiblePageControl()
    let pageControl3 = FlexiblePageControl()
    let pageControl4 = FlexiblePageControl()
    let pageControl5 = FlexiblePageControl()

    @IBOutlet weak var pageControl6: FlexiblePageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollSize, height: scrollSize)
        scrollView.center = view.center
        scrollView.contentSize = CGSize(width: scrollSize * CGFloat(numberOfPages), height: scrollSize)
        scrollView.isPagingEnabled = true

        scrollView.contentOffset = CGPoint(x: scrollSize * CGFloat(startPage), y: 0)

        pageControl1.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 16)
        pageControl2.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 36)
        pageControl3.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 56)
        pageControl4.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 76)
        pageControl5.center = CGPoint(x: scrollView.center.x, y: scrollView.frame.maxY + 96)

        // testing all permutations of ordering these statements

        pageControl1.numberOfPages = numberOfPages
        pageControl1.displayCount = displayCount
        pageControl1.currentPage = startPage

        pageControl2.displayCount = displayCount
        pageControl2.numberOfPages = numberOfPages
        pageControl2.currentPage = startPage

        pageControl3.currentPage = startPage
        pageControl3.displayCount = displayCount
        pageControl3.numberOfPages = numberOfPages

        pageControl4.displayCount = displayCount
        pageControl4.currentPage = startPage
        pageControl4.numberOfPages = numberOfPages

        pageControl5.currentPage = startPage
        pageControl5.numberOfPages = numberOfPages
        pageControl5.displayCount = displayCount

        pageControl6.numberOfPages = numberOfPages
        pageControl6.currentPage = startPage
        pageControl6.displayCount = displayCount

        for index in 0 ..< numberOfPages {
            let view = UIImageView(frame: CGRect(x: CGFloat(index) * scrollSize, y: 0, width: scrollSize, height: scrollSize))
            let imageNamed = NSString(format: "image%02d.jpg", index)
            view.image = UIImage(named: imageNamed as String)
            scrollView.addSubview(view)
        }

        view.addSubview(scrollView)
        view.addSubview(pageControl1)
        view.addSubview(pageControl2)
        view.addSubview(pageControl3)
        view.addSubview(pageControl4)
        view.addSubview(pageControl5)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        pageControl1.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl2.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl3.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl4.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl5.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
        pageControl6.setProgress(contentOffsetX: scrollView.contentOffset.x, pageWidth: scrollView.bounds.width)
    }
}
