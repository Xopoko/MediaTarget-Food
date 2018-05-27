//
//  MainScreenMainScreenViewController.swift
//  MediaTarget-Food
//
//  Created by Horoko on 25/05/2018.
//  Copyright © 2018 MediaTarget. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var output: MainScreenViewOutput!
    
    private var dataSource: MainScreenTableDataSource?
    private var emptyView: EmptyView?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

}

extension MainScreenViewController: MainScreenViewInput {
    func updateData(with recipes: [ApiRecipe]) {
        dataSource?.reloadData(with: recipes)
        removeEmptyView()
    }
    
    // MARK: MainScreenViewInput
    func setupInitialState() {
        title = "MainScreen"
        startEmpty()
        setupTableView()
    }
    
    func showError() {
        errorEmpty()
    }
}

extension MainScreenViewController {
    private func setupTableView() {
        dataSource = MainScreenTableDataSource(tableView)
        dataSource?.infiniteLoadAction = { [weak self] in
            self?.output.didInfinite()
        }
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.tableFooterView = UIView()
    }
}

//MARK: Empty controller
extension MainScreenViewController {
    private func removeEmptyView() {
        emptyView?.removeFromSuperview()
        emptyView = nil
    }
    
    private func createEmpty() {
        if emptyView == nil {
            emptyView = EmptyView()
            view.addSubview(emptyView!)
            emptyView?.constraintToParrentCenter(widthOffset: -40)
        }
    }
    
    private func errorEmpty() {
        createEmpty()
        emptyView!.configure(with: "Ошибка", detail: "Повторить")
    }
    
    private func startEmpty() {
        createEmpty()
        emptyView!.configure(with: "Загрузка...", detail: "")
    }
}
