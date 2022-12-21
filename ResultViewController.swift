//
//  ResultViewController.swift
//  Currency Converter
//
//  Created by Dev Salvi on 21/12/22.
//

import UIKit

class ResultViewController: UIViewController {

  
    @IBOutlet weak var reCalPresses: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
