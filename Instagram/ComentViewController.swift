//
//  ComentViewController.swift
//  Instagram
//
//  Created by Hiroki Sato on 2020/06/29.
//  Copyright © 2020 hiroki.sato. All rights reserved.
//

import UIKit

class ComentViewController: UIViewController {

    @IBOutlet weak var comentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        comentTextField.becomeFirstResponder()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeVC:HomeViewController = segue.destination as! HomeViewController
        //設定されている画像を次画面へ渡す
        homeVC.coment = comentTextField.text!
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
