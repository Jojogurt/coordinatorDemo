//
//  PlayerCoordinator.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerCoordinatorDelegate: class {
    func showSleepMode()
    func hideSleepMode()
}

class PlayerCoordinator: Coordinator {

    fileprivate let navigationController: UINavigationController
    var childCoordinators = [Coordinator]()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let playerController = PlayerViewController.instantiateFromStoryboard()
        playerController.delegate = self
        navigationController.show(playerController, sender: self)
    }
}

extension PlayerCoordinator: PlayerCoordinatorDelegate {
    func showSleepMode() {
        let sleepModeController = SleepModeViewController.instantiateFromStoryboard()
        sleepModeController.delegate = self
        navigationController.present(sleepModeController, animated: true)
    }

    func hideSleepMode() {
        navigationController.dismiss(animated: true)
    }
}
