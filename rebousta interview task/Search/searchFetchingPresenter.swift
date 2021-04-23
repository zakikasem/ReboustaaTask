//
//  searchFetchingPresenter.swift
//  rebousta interview task
//
//  Created by zaki kasem on 22/04/2021.


import Foundation
protocol nameFetching {
    var NameView : searchView! {get set}
    
    func fetchNames()
    func getNamesCount() -> Int
    func getItem(atIndex: Int) -> RepoModel
    func whenRowSelected(name : RepoModel)
}

class nameFetchingPresenter:nameFetching {
    weak var NameView: searchView!
    let router : searchRouter!
    
    init(NameView : searchView , router : searchRouter ) {
        self.NameView = NameView
        self.router = router
    }
    
   
    
   private var repoos = [RepoModel]()
    
    func fetchNames() {
        let url = "https://api.github.com/repositories"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data  , error == nil else {
                print("something went wrong ")
                return
            }
            // now we have data
            var result : RepoModel?
            
            do {
                result = try  JSONDecoder().decode(RepoModel.self, from: data)
                
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
         
        }
       
        }
    func getNamesCount() -> Int {
        return repoos.count
    }
    
    func getItem(atIndex: Int) -> RepoModel {
        return repoos[atIndex]
    }
    
    
    func whenRowSelected(name: RepoModel) {
        
    }
    
    }
   
    
    
