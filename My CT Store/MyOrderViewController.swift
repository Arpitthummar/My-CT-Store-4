//
//  MyOrderViewController.swift
//  My CT Store
//
//  Created by Arpit Thummar on 10/04/23.
//

import UIKit
import SDWebImage

class MyOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: OrderViewModel = OrderViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        tableView.register(UINib(nibName: OrderDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OrderDetailsTableViewCell.identifier)
        
        viewModel.fetchDetalisOfOrders { result in
            switch result {
            case .success():
                    self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numOfRow()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableViewCell.identifier) as! OrderDetailsTableViewCell
        cell.orderId.text = viewModel.arrOrderDetails[indexPath.row].getOrderId()
        cell.dateTime.text = viewModel.arrOrderDetails[indexPath.row].getdateAndTime()
        cell.orderStatus.text = viewModel.arrOrderDetails[indexPath.row].getStats()
        cell.vendorName.text = viewModel.arrOrderDetails[indexPath.row].getVendorName()
        cell.totalAmount.text = viewModel.arrOrderDetails[indexPath.row].getTotalPrice()
        cell.vImage.sd_setImage(with: URL(string: viewModel.arrOrderDetails[indexPath.row].getImage()))
        cell.cellForRow(view: cell.orderStatus)
       return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
