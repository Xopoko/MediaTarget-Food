//
//  MainScreenMainScreenInteractor.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//
import RealmSwift

class MainScreenInteractor: MainScreenInteractorInput {
    weak var output: MainScreenInteractorOutput!
}

//MARK: Network
extension MainScreenInteractor {
    func loadRecipes(from page: Int) {
        FoodProvider.request(.search(query: "", page: page)) { result in
            switch result {
            case .success(let data):
                guard let recipes = (try? data.map(ApiSearch.self))?.recipes else { fallthrough }
                self.saveRecipes(recipes)
                self.output.searchDidSuccess(recipes)
            case .failure:
                if page == 0 {
                    self.getRecipes()
                } else {
                    self.output.searchDidError()
                }
            }
        }
    }
}

extension MainScreenInteractor {
    
    private func getRecipes() {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let recipes = Array(realm.objects(DBRecipe.self))
                let apiRecipes = recipes.compactMap { ApiRecipe(title: $0.title, publisher: $0.publisher) }
                DispatchQueue.main.async {
                    self.output.searchDidSuccess(apiRecipes)
                }
            }
        }
    }
    
    private func saveRecipes(_ recipes: [ApiRecipe]) {
        guard let realm = try? Realm() else { return }
        var dbRecipes = [DBRecipe]()
        for r in recipes {
            let dbRecip = DBRecipe()
            dbRecip.title = r.title
            dbRecip.publisher = r.publisher
            dbRecipes.append(dbRecip)
        }
        try! realm.write {
            realm.add(dbRecipes)
        }
    }
}

