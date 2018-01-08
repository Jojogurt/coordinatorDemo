//
//  SleepModeViewController.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import UIKit

final class SleepModeViewController: UIViewController, StoryboardInstantiable {
    static var storyboardIdentifier = "Main"
    weak var delegate: PlayerCoordinatorDelegate?

    @IBAction func hideSleepMode(_ sender: UIButton) {
        delegate?.hideSleepMode()
    }
}
