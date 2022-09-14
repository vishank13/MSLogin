//
//  NavigationRouter.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation
import UIKit

class ProjectWireframe {
    
    static func navigateToHomeViewController(for User: LoginAPIResponse, with navigationController: UINavigationController?) {
        let storyBoard = UIStoryboard(name: AppStoryboardName.main.rawValue, bundle: nil)
        if let homeViewController = storyBoard.instantiateViewController(withIdentifier: HomeViewController.className) as? HomeViewController, let navigationController = navigationController {
            homeViewController.user = User
            navigationController.setNavigationBarHidden(true, animated: true)
            navigationController.pushViewController(homeViewController, animated: true)
        }
    }
    
    static func provideLoginViewController() -> LoginViewController {
        let storyBoard = UIStoryboard(name: AppStoryboardName.main.rawValue, bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: LoginViewController.className) as! LoginViewController
        loginViewController.loginViewModel = LoginViewModel()
        return loginViewController
    }
    
}
