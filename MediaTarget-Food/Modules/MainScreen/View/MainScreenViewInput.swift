//
//  MainScreenMainScreenViewInput.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//

protocol MainScreenViewInput: class {
    func setupInitialState()
    func updateData(with recipes: [ApiRecipe])
    func showError()
}
