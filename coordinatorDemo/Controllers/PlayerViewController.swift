//
//  ChildViewController.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import UIKit

final class PlayerViewController: UIViewController, StoryboardInstantiable {

    static var storyboardIdentifier: String = "Main"
    weak var delegate: PlayerCoordinatorDelegate?

    var isSleepModeVisible = false

    @IBAction func showSleepMode(_ sender: UIButton) {
        delegate?.showSleepMode()
    }
}
