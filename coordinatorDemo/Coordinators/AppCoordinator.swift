//
//  AppCoordinator.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private var mainViewController: ViewController?

    var childCoordinators = [Coordinator]()

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showMainViewController()
        attachPlayerViewController()
    }

    func showMainViewController() {
        let viewController = ViewController.instantiateFromStoryboard()
        mainViewController = viewController
        navigationController.show(viewController, sender: self)
    }

    func attachPlayerViewController() {
        let playerNavigationController = UINavigationController()
        playerNavigationController.isNavigationBarHidden = true

        let playerCoordinator = PlayerCoordinator(navigationController: playerNavigationController)
        playerCoordinator.start()
        addChildCoordinator(childCoordinator: playerCoordinator)

        mainViewController?.attachPlayerViewController(playerNavigationController)
    }
}
