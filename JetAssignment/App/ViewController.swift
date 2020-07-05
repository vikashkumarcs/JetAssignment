//
//  ViewController.swift
//  JetAssignment
//
//  Created by Vikash on 04/07/20.
//  Copyright © 2020 Vikash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    lazy var viewModal: ViewModel = {
        let viewModal = ViewModel(services: APIService(),dataMaping: DataMaping())
        return viewModal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializer()
        
        
    }
    
    private func initializer() {
        
        viewModal.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModal.alertMessage {
                    self?.showAlert( message )
                }
            }
        }
        
        viewModal.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableview.reloadData()
            }
        }
        
    }

    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 410
    }
    
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModal.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "CustomTVCellId", for: indexPath) as? CustomTVCell
        
        guard let cell = cell1 else {
            return UITableViewCell()
        }
        
        let cellInfo = self.viewModal.dataSource[indexPath.row]
        cell.cellConfiguration(cellInfo: cellInfo)
        return cell
    }
    
    
}

