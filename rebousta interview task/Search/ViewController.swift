//
//  ViewController.swift
//  rebousta interview task
//
//  Created by zaki kasem on 21/04/2021.
//

import UIKit

protocol searchView : AnyObject{
    func reloadData()
}

class ViewController: UIViewController , searchView {
   
    var presenter : nameFetching!
    
    //MARK:-Variables
  
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    var searchName = [String]()
    var isSearching = false
    //MARK:-ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    func reloadData() {
        searchTableView.reloadData()
    }
    
    
}
//MARK:-HomeVC Extension
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNamesCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! nameCell
        let name = presenter.getItem(atIndex: indexPath.row).fullName
        cell.configure(name: name ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = presenter.getItem(atIndex: indexPath.row)
        self.presenter.whenRowSelected(name: name)
        
    }
}
    extension ViewController : UISearchBarDelegate {
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                searchName = searchName.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
                isSearching = true
                searchTableView.reloadData()
            }
            
            func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
                isSearching = false
                searchBar.text = ""
                searchTableView.reloadData()
            }
        
    }

