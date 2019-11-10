//
//  ViewController.swift
//  CharityProject
//
//  Created by Vinayak Sareen on 04/10/2019.
//  Copyright © 2019 Vinayak Sareen. All rights reserved.
//

import UIKit


class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var moviesTableView: UITableView!
    let isFirstTime = UserDefaults.standard
    
    var movies: [Movie]?{
        didSet{
            self.moviesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openState()
        tableViewSettings()
        fetchTrendingData()
        testYoutubeVideoLink()
    }
    
    fileprivate func testYoutubeVideoLink(){
        let link = "https://www.youtube.com/watch?v=t433PEQGErc"
    }
    
    fileprivate func fetchTrendingData(){
        let api = Api.instance
        api.downloadMovies { (error, movie) in
            if (error != nil){
                return
            }
            
            DispatchQueue.main.async {
                // update the cells.
                guard let movie = movie else { return }
                self.movies = movie.results
            }
        }
    }
    
    fileprivate func tableViewSettings(){
        let charityOrganisationNib = UINib(nibName: "CharityOrganisationCell", bundle: nil)
        let headerCellNib = UINib(nibName: "HeaderCell", bundle: nil)
        moviesTableView.register(charityOrganisationNib, forCellReuseIdentifier: "charityOrgCell")
        moviesTableView.register(headerCellNib, forCellReuseIdentifier: "HeaderCell")
        moviesTableView.showsVerticalScrollIndicator = false
        moviesTableView.separatorStyle = .none
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.estimatedRowHeight = 40
    }
    
    fileprivate func openState(){
        isFirstTime.set(true, forKey: "hasOpenBefore")
    }
}


extension HomeController{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = moviesTableView.dequeueReusableCell(withIdentifier: "HeaderCell")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let estimatedHeaderHeight = 20 * (self.view.frame.height / 100) // this will be 20% of the width
        return estimatedHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
      }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "charityOrgCell", for: indexPath) as! CharityOrganisationCell
        cell.movieDetail = self.movies?[indexPath.item]
        return cell
        
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 4){
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        // push to navigation controller.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: -20, y: 0)
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.5
            cell.transform = .identity
        }
    }
    
}


