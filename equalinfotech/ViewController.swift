//
//  ViewController.swift
//  equalinfotech
//
//  Created by STC on 08/02/23.
//

import UIKit
import SDWebImage
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
    
    @IBOutlet weak var backbtn: UINavigationItem!
    
    @IBOutlet weak var ListTableView: UITableView!
    
    var lists = [information]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ListTableView.dataSource = self
        ListTableView.delegate = self
        nib()
        backbtn.titleView?.backgroundColor = .orange
        dataFromApi {
            self.ListTableView.reloadData()
        }
    }
    func nib(){
        let nibName = UINib(nibName: "listTableViewCell", bundle: nil)
        ListTableView.register(nibName, forCellReuseIdentifier: "listTableViewCell")
    }
    
    func dataFromApi( completed : @escaping() -> ())
    {
     let ApiUrl = "https://demo.equalinfotech.com/zervers/Api/get_user_list"
        guard let url = URL(string: ApiUrl) else {
            print("data not found")
            return
        }
        URLSession.shared.dataTask(with: url){ data ,resonse ,error in
            if(error == nil){
                do{
                    let jsonDecoder = JSONDecoder()
                  let json = try! jsonDecoder.decode(apiResponce.self, from: data!)
                    self.lists = json.data
                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    completed()
                }
            }
            
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath) as! listTableViewCell
        cell.nameLabel.text = lists[indexPath.row].name
        cell.yearLabel.text = lists[indexPath.row].id
        //let imgUrl = NSURL(string: lists[indexPath.row].image)
       // cell.proImg.sd_setImage(with: imgUrl as URL?)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        141
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController")as! secondViewController
        let dataPassTo1 = String(lists[indexPath.row].name)
        nav.dataFromFVC1 = dataPassTo1
        let dataPassTo2 = String(lists[indexPath.row].image)
        nav.dataFromFVC2 = dataPassTo2
        let dataPassTo3 = lists[indexPath.row].id
        nav.dataFromFVC3 = dataPassTo3
        let dataPassTo4 = String(lists[indexPath.row].details.additional_information)
        nav.dataFromFVC4 = dataPassTo4
        navigationController?.pushViewController(nav, animated: true)
    }
    
}
