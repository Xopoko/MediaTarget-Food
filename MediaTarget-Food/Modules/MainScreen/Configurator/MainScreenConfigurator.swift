//
//  MainScreenMainScreenConfigurator.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//

import UIKit
import Typhoon

class MainScreenModuleConfigurator: TyphoonAssembly {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainScreenViewController) {

        let router = MainScreenRouter()

        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainScreenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}

//class MainScreenAssembly: TyphoonAssembly {
//    
//    @objc public dynamic func interactor() -> AnyObject {
//        return TyphoonDefinition.withClass(MainScreenInteractor.self) { def in
//            def?.injectProperty("output", with: self.presenter())
//            } as AnyObject
//    }
//    
//    @objc public dynamic func view() -> AnyObject {
//        return TyphoonDefinition.withClass(MainScreenViewController.self) { def in
//            def?.injectProperty("output", with: self.presenter())
//            } as AnyObject
//    }
//    
//    @objc public dynamic func presenter() -> AnyObject {
//        return TyphoonDefinition.withClass(MainScreenPresenter.self) { def in
//           // def?.injectProperty("router", with: self.router())
//            def?.injectProperty("view", with: self.view())
//            def?.injectProperty("interactor", with: self.interactor())
//            } as AnyObject
//    }
//    
////    @objc dynamic func router() -> Any! {
////        return TyphoonDefinition.withClass(MainScreenRouter.self) { def in
////            def?.injectProperty("view", with: self.view)
////        }
////    }
//}


