//
//  TabBarViewController.swift
//  codepath-week-04-lecture
//
//  Created by mmuno on 10/6/15.
//  Copyright © 2015 mamuso. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    var blueViewController: UIViewController!
    var greenViewController: UIViewController!
    var pinkViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        blueViewController = storyboard.instantiateViewControllerWithIdentifier("BlueViewController")
        greenViewController = storyboard.instantiateViewControllerWithIdentifier("GreenViewController")
        pinkViewController = storyboard.instantiateViewControllerWithIdentifier("PinkViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPressBlueButton(sender: AnyObject) {
        // TAKE A LOOK AT THIS
        blueViewController.willMoveToParentViewController(self)

        blueViewController.view.frame = contentView.frame
        contentView.addSubview(blueViewController.view)
        
        blueViewController.didMoveToParentViewController(self)
    }

    @IBAction func onPressGreenButton(sender: AnyObject) {
        greenViewController.view.frame = contentView.frame
        contentView.addSubview(greenViewController.view)
    }
    
    @IBAction func onPressPinkButton(sender: AnyObject) {
        pinkViewController.view.frame = contentView.frame
        contentView.addSubview(pinkViewController.view)
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
