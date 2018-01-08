//
//  Coordinator.swift
//  coordinatorDemo
//
//  Created by kkedziora on 08.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }

    func start()
}

extension Coordinator {

    /// Add a child coordinator to the parent
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    /// Remove a child coordinator from the parent
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }

}
