//
//  CollectionViewController.swift
//  URLSession-Task
//
//  Created by Jeremiah on 02/06/17.
//  Copyright © 2017 Jeremiah. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var DetailCollectionView: UICollectionView!
    var arrayDetails:[[String: Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlString = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=739e7235737c4577b0cf18b33b93c45b"
        getDataFromServer(urlString)
     
    }
//MARK: CollectionView Delegate
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return arrayDetails.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.labelTitle.text = arrayDetails[indexPath.row]["title"] as? String
        cell.labelAuthor.text = arrayDetails[indexPath.row]["author"] as? String
        cell.buttonLink .setTitle(arrayDetails[indexPath.row]["url"] as? String, for: .normal)
       
        cell.imagePost.downloadedFrom(url: URL(string: (arrayDetails[indexPath.row]["urlToImage"] as? String)!)!)
        cell.textviewDescription.text = arrayDetails[indexPath.row]["description"] as? String
        let date = arrayDetails[indexPath.row]["publishedAt"] as? String
        cell.buttonLink.tag = indexPath.row
        cell.labelDate.dateString(date!)
        
        return cell
        
    }
   
    // MARK: Service Call
    func getDataFromServer(_ url: String) {
        let requestURL = URL(string: url)
        let task = URLSession.shared.dataTask(with: requestURL!) { (data, response, error) in
            guard let data = data else{
                return
            }
            do {
                if let json : [String:Any] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]{
                    
                    
                    let articles = json["articles"] as? [[String: Any]]
                   print(articles?[0]["author"] ?? "NOEN")
                    guard let article = articles else{
                        return
                    }
                    self.arrayDetails = article
                    DispatchQueue.main.async {
                        // Update UI
                        self.DetailCollectionView.reloadData()
                    }
                    
                                       
                }
                
                
                
            }catch{
                print("error in JSONSerialization")
            }
            
            
            
            
        }
        task.resume()
        
        
    }
    
    
    
    @IBAction func buttonActionSafari(_ sender: Any) {
        let stringUrl = arrayDetails[(sender as AnyObject).tag]["url"] as? String
        if let requestUrl = NSURL(string: stringUrl!) {
            UIApplication.shared.open(requestUrl as URL, options: [:], completionHandler: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
