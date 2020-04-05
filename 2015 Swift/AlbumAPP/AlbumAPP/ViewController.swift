//
//  ViewController.swift
//  AlbumAPP
//
//  Created by TK on 2016/10/25.
//  Copyright © 2016年 TK. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var imagePicker = UIImagePickerController()
    var selectImage:UIImage = UIImage() //產生不可選型態的空物件
    
    @IBOutlet weak var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       myImageView.image = UIImage(named: "IMG")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cameraClick(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)//確認是否有相機
        {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            self.present(imagePicker, animated: false, completion: nil)
        }else{ //沒有相機
            let alertController = UIAlertController(title: "No camera", message: "Can't take a photo", preferredStyle: UIAlertControllerStyle.alert)
            let butt1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (butt1) in
            })
        alertController.addAction(butt1)
        self.present(alertController, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        selectImage = info[UIImagePickerControllerOriginalImage] as! UIImage//取得相片的方法
        UIImageWriteToSavedPhotosAlbum(selectImage, nil, nil, nil) //儲存在相簿
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func chooseClick(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        self.present(imagePicker, animated: false, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        selectImage = image
        TKPhoto()
        self.dismiss(animated: true, completion: nil)
    }
    func TKPhoto()
    {
        if selectImage.size.width > selectImage.size.height //判斷橫向直向
        {
            myImageView.frame.origin.x = 0
            myImageView.frame.origin.y = 0
            let screen = UIScreen.main
            myImageView.frame.size.width = screen.bounds.size.height //自動適應設備的寬高
            myImageView.frame.size.height = screen.bounds.size.width //自動適應設備的寬高
        }else{ //直向
            myImageView.frame.origin.x = 0
            myImageView.frame.origin.y = 0
            let screen = UIScreen.main
            myImageView.frame.size.width = screen.bounds.size.width //自動適應設備的寬高
            myImageView.frame.size.height = screen.bounds.size.height //自動適應設備的寬高
        }
        myImageView.image = selectImage //圖片丟進View裡面
    }


}

