//
//  DetailViewController.swift
//  EnumTableViewExample
//
//  Created by 염성필 on 2023/08/01.
//

import UIKit

class DetailViewController: UIViewController {

    var category: String?
    var mainTitle: String?
    var mainColor: UIColor?
    
    @IBOutlet var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = category
        self.textLabel.text = mainTitle
        self.textLabel.textColor = mainColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
