//
//  HamburgerViewController.swift
//  codepath-week-04-lecture
//
//  Created by mmuno on 10/6/15.
//  Copyright © 2015 mamuso. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var initialCenter: CGPoint!
    var menuViewController: UIViewController!
    var contentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        contentViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        menuView.addSubview(menuViewController.view)
        contentView.addSubview(contentViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
//        let location = sender.locationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = contentView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            contentView.center = CGPoint(x: translation.x + initialCenter.x, y: initialCenter.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    if velocity.x < 0 {
                        self.contentView.center = self.view.center
                    } else {
                        self.contentView.center = CGPoint(x: self.view.center.x + (self.contentView.frame.width - 50), y: self.view.center.y)
                    }
                })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
