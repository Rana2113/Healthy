import Foundation

typealias SplashViewModelType = SplashViewModelInput & SplashViewModelOutput

protocol SplashViewModelInput {
    func startCooking()
}

protocol SplashViewModelOutput {}
