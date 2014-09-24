//
//  CreateAccountViewController.swift
//  CarouselDemo
//
//  Created by Ryan Sims on 9/21/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var formScrollView: UIScrollView!

    @IBOutlet weak var formContainerView: UIView!

    @IBOutlet weak var instructionTextImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkBoxButton: UIButton!

    @IBOutlet weak var actionButtonsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        formScrollView.contentSize = CGSize(width:320, height:502)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        formScrollView.contentInset.top = 0
        formScrollView.contentInset.bottom = 0
        formScrollView.scrollIndicatorInsets.top = 0
        formScrollView.scrollIndicatorInsets.bottom = 0
        
        // perform animations when keyboard opens up
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) -> Void in
            var userInfo = notification!.userInfo!
            
            // Get the keyboard height and width
            // Size will vary
            var kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
            
            // scroll the form view
            // an offset to scroll
            var instructionOffset = self.instructionTextImage.frame.size.height + 20
            
            // actually scroll the view
            self.formScrollView.setContentOffset(CGPointMake(0, instructionOffset), animated: true)
            
            // animate the buttons up to the height of where the fields are
            UIView.animateWithDuration(
                animationDuration, delay: 0.0,
                options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,
                animations: {
                    self.actionButtonsView.frame.origin.y = self.formContainerView.frame.size.height + 20;
                },
                completion: nil)
            // resize the scrollview
            self.formScrollView.contentSize = CGSize(width:320, height:(self.formContainerView.frame.size.height + self.actionButtonsView.frame.height + kbSize.height + 20))
        })
        
        // reset view after keyboard closes
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) -> Void in
            var userInfo = notification!.userInfo!
            
            // Get the keyboard height and width
            // Size will vary
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
            
            // scroll the form view
            // an offset to scroll
            var instructionOffset = self.instructionTextImage.frame.size.height + 20
            
            // actually scroll the view
            self.formScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            
            // animate the buttons up to the height of where the fields are
            UIView.animateWithDuration(
                animationDuration, delay: 0.0,
                options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,
                animations: {
                    self.actionButtonsView.frame.origin.y = self.formScrollView.frame.size.height - (self.actionButtonsView.frame.size.height + 15);
                },
                completion: nil)
            // resize the scrollview
            //self.formScrollView.contentSize = CGSize(width:320, height:(self.formContainerView.frame.size.height + self.actionButtonsView.frame.height + 20))
        })
    }
    
    @IBAction func swipeDownGesture(sender: UISwipeGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func tapView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTap(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    @IBAction func createButtonTap(sender: AnyObject) {
        // handle empty email field
        if (self.firstNameTextField.text == "" ||
            self.lastNameTextField.text == "" ||
            self.emailTextField.text == "" ||
            self.passwordTextField.text == "") {
            var alertView = UIAlertView(title: "Information required", message: "To create an account, please complete the form below.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            view.endEditing(true)
            return
        }
            // handle empty password
        else {
            var alertView = UIAlertView(title: "Creating your account...", message:"", delegate: self, cancelButtonTitle: nil)
            alertView.show()
            delay(2, closure: { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("showTourSegue", sender: nil)
            })
        }
    }
    @IBAction func checkBoxButtonTap(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
