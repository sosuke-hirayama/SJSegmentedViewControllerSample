//
//  DetailViewController.swift
//  SJSegmentedViewControllerSample
//
//  Created by Sosuke Hirayama on 2016/08/17.
//  Copyright © 2016年 Sosuke Hirayama. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class DetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            // self.configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupViews() {
        if let storyboard = self.storyboard {
            
            let headerViewController = storyboard
                .instantiateViewControllerWithIdentifier("HeaderViewController")
            
            let firstViewController = storyboard
                .instantiateViewControllerWithIdentifier("FirstViewController")
            firstViewController.title = "First"
            
            let secondViewController = storyboard
                .instantiateViewControllerWithIdentifier("SecondViewController")
            secondViewController.title = "Second"
            
            let thirdViewController = storyboard
                .instantiateViewControllerWithIdentifier("ThirdViewController")
            thirdViewController.title = "Third"
            
            let segmentedViewController = SJSegmentedViewController(
                headerViewController: headerViewController,
                segmentControllers: [
                    firstViewController,
                    secondViewController,
                    thirdViewController])
            segmentedViewController.headerViewHeight = 100.0
            
            addChildViewController(segmentedViewController)
            containerView.addSubview(segmentedViewController.view)
            segmentedViewController.view.frame = containerView.bounds
            segmentedViewController.didMoveToParentViewController(self)
        }
    }

}

