//
//  MainScreenMainScreenInitializer.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//

import UIKit

class MainScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: MainScreenViewController!

    override func awakeFromNib() {
        let configurator = MainScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainscreenViewController)
    }

}
