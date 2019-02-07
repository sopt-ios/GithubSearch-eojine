//
//  ViewController.swift
//  GithubSearch
//
//  Created by 양어진 on 01/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var userList = [SearchItem]()
    var perpageNum = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        getUserResult(pageNum: perpageNum)
    }
    
    func getUserResult(pageNum : Int){
        SearchService.shared.getSearchResult(tag: searchBar.text!, perPage: pageNum) { [weak self] (data) in
            guard let `self` = self else { return }
            let searchItems = data as [SearchItem]
            self.userList = searchItems
            
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        getUserResult(pageNum: perpageNum)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = userList[indexPath.row]
        
        cell.userID.text = user.login
        cell.userImg.imageFromUrl(gsno(user.avatar_url), defaultImgPath: "")
        
//        UserService.shared.getUserRepoNumResult(userName: gsno(user.login)) { (repoNumber) in
//
//            print("reponumber : ", repoNumber)
//            cell.userRepoNum.text = "Number of repos: \(String(repoNumber))"
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let lastElement = userList.count - 1
        if indexPath.row == lastElement {
            perpageNum += 20
            getUserResult(pageNum: perpageNum)
        }
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchUser), object: nil)
        self.perform(#selector(self.searchUser), with: nil, afterDelay: 0.5)
    }

    @objc func searchUser(){
        self.userList.removeAll()
        getUserResult(pageNum: perpageNum)
    }
}
