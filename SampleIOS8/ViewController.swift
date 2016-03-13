//
//  ViewController.swift
//  SampleIOS8
//
//  Created by Ampy on 3/13/16.
//  Copyright (c) 2016 Ampy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self .growAnimation()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animateAlongsideTransition({ context in
            self.heightConstraint.constant = 0
            self.widthConstraint.constant = 0
            self.imageView.alpha = 0
            }, completion: { [weak self] context in
                let strongWeak = self
                strongWeak?.growAnimation()
        })
    }
    
    func growAnimation() {
       UIView.animateWithDuration(1.5, delay: 0.5, usingSpringWithDamping: 60, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseOut, animations: { [weak self] () -> Void in
        self?.heightConstraint.constant = 512
        self?.widthConstraint.constant = 512
        self?.imageView.alpha = 1.0
        self?.view.layoutIfNeeded()
       }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

