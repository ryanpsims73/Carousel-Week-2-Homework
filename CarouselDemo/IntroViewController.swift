//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Ryan Sims on 9/20/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSizeMake(320, backgroundImage.image!.size.height)
        scrollView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToCreateAccountSegue(segue:UIStoryboardSegue) {
        self.scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func animateImage(
        image: UIImageView,
        xPos1: Double,
        yPos1: Double,
        rot1: Double,
        scale1: Double,
        xPos2: Double,
        yPos2: Double,
        rot2: Double,
        scale2: Double
        ) {
        // tracking variables
        let tile = image
        var scrollPosition = Double(self.scrollView.contentOffset.y)
        var scrollHeight = Double(self.scrollView.contentSize.height)
        var scrollPercentage = (scrollPosition / scrollHeight) * 2
        if (scrollPercentage > 1) {
            scrollPercentage = 1
        }
        
        var xTransform = CGFloat((xPos2 - xPos1) * scrollPercentage)
        var yTransform = CGFloat((yPos2 - yPos1) * scrollPercentage)
        var rotTransform = ((rot2 - rot1) * scrollPercentage) + rot1
        var scaleTransform = CGFloat(scale2)
        
        if (scale1 != scale2) {
            scaleTransform = CGFloat(((scale2 - scale1) * scrollPercentage) + scale1)
        }
            
        // println("scroll percentage is \(scrollPercentage)")
        // println("the image is \(tile.image!.size)")
        // println("transform x position to \(xTransform)")
        // println("transform y position to \(yTransform)")
        // println("rotation to \(rotTransform)")
        // println("scale to \(scaleTransform)")

        tile.transform = CGAffineTransformMakeTranslation(xTransform, yTransform)
        tile.transform = CGAffineTransformScale(tile.transform, scaleTransform, scaleTransform)
        tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(rotTransform * M_PI / 180))

        // animations
        // animations should stop once you get to bottom of screen
        // need to pass destination, etc to the animation function
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        animateImage(introTile1, xPos1: -31, yPos1: 464, rot1: -9, scale1: 1, xPos2: 46, yPos2: 743, rot2: 0, scale2: 1)
        animateImage(introTile2, xPos1: 236, yPos1: 489, rot1: -9, scale1: 1.75, xPos2: 201, yPos2: 743, rot2: 0, scale2: 1)
        animateImage(introTile3, xPos1: 209, yPos1: 400, rot1: 9, scale1: 1.60, xPos2: 201, yPos2: 820, rot2: 0, scale2: 1)
        animateImage(introTile4, xPos1: 120, yPos1: 499, rot1: 9, scale1: 1.5, xPos2: 46, yPos2: 908, rot2: 0, scale2: 1)
        animateImage(introTile5, xPos1: -9, yPos1: 500, rot1: 9, scale1: 2, xPos2: 124, yPos2: 999, rot2: 0, scale2: 1)
        animateImage(introTile6, xPos1: 100, yPos1: 410, rot1: -9, scale1: 1.55, xPos2: 201, yPos2: 900, rot2: 0, scale2: 1)
    }
    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        println("at the top")
    }


}
