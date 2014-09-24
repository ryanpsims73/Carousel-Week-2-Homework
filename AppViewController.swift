//
//  AppViewController.swift
//  CarouselDemo
//
//  Created by Ryan Sims on 9/20/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var bannerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getScrollSize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBannerTap(sender: AnyObject) {
        // slide banner left
        // move scroll up
        UIView.animateWithDuration(0.25){
            self.bannerView.frame.origin.x = -320
            self.bannerView.frame.size.height = 0
            self.bannerView.alpha = 0
            self.feedImage.frame.origin.y = 0
        }
        getScrollSize()
    }
    
    func getScrollSize() {
        self.scrollView.contentSize = CGSize(width: 320, height: self.feedImage.frame.size.height + self.bannerView.frame.size.height)
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
