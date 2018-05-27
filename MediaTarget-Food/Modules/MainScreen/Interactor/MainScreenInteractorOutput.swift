//
//  MainScreenMainScreenInteractorOutput.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//

import Foundation

protocol MainScreenInteractorOutput: class {
    func searchDidSuccess(_ result: [ApiRecipe])
    func searchDidError()
}
