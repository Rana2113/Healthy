//
//  Coordinator.swift
//  Healthy
//
//  Created by Abdelrahman Zain on 29/10/2025.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationControl : UINavigationController { get }
    
    func start()
}
