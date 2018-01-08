//
//  ViewController.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, StoryboardInstantiable {

    static var storyboardIdentifier = "Main"
    var isMinimalized = true
    var playerViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animatePlayer(_ sender: Any) {
        if isMinimalized {
            UIView.animate(withDuration: 0.3, animations: {
                self.playerViewController?.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
        }else {
            UIView.animate(withDuration: 0.3, animations: {
                self.playerViewController?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        isMinimalized = !isMinimalized
    }

    func attachPlayerViewController(_ playerViewController: UIViewController) {
        addChildViewController(playerViewController)
        playerViewController.view.frame = CGRect(x: 20, y: 20, width: 250, height: 150)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParentViewController: self)

        self.playerViewController = playerViewController
    }

}

