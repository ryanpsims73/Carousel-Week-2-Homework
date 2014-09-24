//
//  TermsViewController.swift
//  CarouselDemo
//
//  Created by Ryan Sims on 9/21/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {


    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
        //println("\(url)")
        let request = NSURLRequest(URL: url)
        //println("\(request)")
        self.webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
