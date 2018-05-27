import UIKit
import DeepDiff

class MainScreenTableDataSource: NSObject {
    var tableView: UITableView!
    var infiniteLoadAction: (() -> Void)?
    var recipes: [ApiRecipe] = [] {
        didSet {
            let changes = diff(old: oldValue, new: recipes)
            if !changes.isEmpty {
                tableView.reload(changes: changes) { complete in }
            }
        }
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
    }
}

extension MainScreenTableDataSource {
    func reloadData(with recipes: [ApiRecipe]) {
        self.recipes = recipes
    }
}

extension MainScreenTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  { return recipes.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeCell.self), for: indexPath) as! RecipeCell
        cell.configure(from: recipes[indexPath.row])
        return cell
    }
}

extension MainScreenTableDataSource: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) { 
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            infiniteLoadAction?()
        }
    }
}
