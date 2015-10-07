//
//  RotationViewController.swift
//  codepath-week-04-lecture
//
//  Created by mmuno on 10/6/15.
//  Copyright © 2015 mamuso. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var rotation: CGFloat!
    var foreshortening: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rotation = 0
        foreshortening = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onRotationChange(sender: UISlider) {
        print("Slider value: \(sender.value)")
        rotation = CGFloat(sender.value)
        updateTransform()
    }
    
    @IBAction func onForeshorteningChange(sender: UISlider) {
        foreshortening = CGFloat(sender.value)
        updateTransform()
    }
    
    func updateTransform() {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / CGFloat(foreshortening)
        
        let angle = CGFloat(rotation) * CGFloat(M_PI) / 180.0
        transform = CATransform3DRotate(transform, angle, 1, 1, 0.5)
        imageView.layer.transform = transform
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
