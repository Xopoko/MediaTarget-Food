class MainScreenPresenter {
    weak var view: MainScreenViewInput!
    var interactor: MainScreenInteractorInput!
    var router: MainScreenRouterInput!
    
    private var recipes: [ApiRecipe] = []
    private var currentPage = 0
    private var isLoading = false
}

extension MainScreenPresenter: MainScreenModuleInput {}
extension MainScreenPresenter: MainScreenViewOutput {
    func viewIsReady() {
        view.setupInitialState()
        interactor.loadRecipes(from: currentPage)
    }
    
    func didInfinite() {
        if !isLoading {
            interactor.loadRecipes(from: currentPage)
            isLoading = true
        }
    }
}
extension MainScreenPresenter: MainScreenInteractorOutput {
    func searchDidSuccess(_ result: [ApiRecipe]) {
        self.recipes += result
        view.updateData(with: self.recipes)
        currentPage += 1
        isLoading = false
    }
    
    func searchDidError() {
        if currentPage == 0 {
            view.showError()
        }
        isLoading = false
    }
}
