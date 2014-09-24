//
//  TourViewController.swift
//  CarouselDemo
//
//  Created by Ryan Sims on 9/20/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class TourViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var tourImage: UIImageView!

    @IBOutlet weak var buttonView: UIView!
    
    let tourLength = 3
    var page : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // setup scroll view
        scrollView.contentSize = CGSizeMake((tourImage.image!.size.width * 4), tourImage.image!.size.height)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }

    @IBAction func pageControlTap(sender: AnyObject) {
        //get the current page based on scroll offset
        page = Int(round(scrollView.contentOffset.x / 320))
        println(page)

        var offsetAmount: CGFloat
        
        offsetAmount = CGFloat(320 + (page * 320))

        // scroll the view
        if (page < tourLength) {
            self.scrollView.setContentOffset(CGPointMake(offsetAmount, 0), animated: true)
            
            // update page location after scrolling
            page = Int(round(offsetAmount / 320))
        }
        self.advancePageControl(page, tourNumber: tourLength)
        println(page)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        //get the current page based on scroll offset
        page = Int(round(scrollView.contentOffset.x / 320))
        // set the current page
        self.advancePageControl(page, tourNumber: tourLength)
    }
    
    func advancePageControl(pageNumber: Int, tourNumber: Int) {
        self.pageControl.currentPage = pageNumber
        
        if (pageNumber == tourNumber) {
            UIView.animateWithDuration(0.5, animations: {
                self.buttonView.alpha = 1.0
                self.pageControl.alpha = 0.0
            })
        }
        else {
            pageControl.alpha = 1.0
            buttonView.alpha = 0.0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
