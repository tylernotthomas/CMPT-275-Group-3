//
//  DeletePhoto.swift
//  AV Foundation
//
//  Created by Curtis Cheung on 2018-10-15.
//  Copyright © 2018 CMPT275_G3. All rights reserved.
//

import UIKit
import FirebaseStorage // CMPT275 Added
import Foundation
import Photos

class DeletePhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            //var imagePicker = UIImagePickerController()
            //imagePicker.delegate = self
            //imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            //imagePicker.allowsEditing = false
            //self.present(imagePicker, animated: true, completion: nil)
            deletePhoto()
        }
        

    }
    func deletePhoto()
    {
        var fetchOptions: PHFetchOptions = PHFetchOptions()
        
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        var fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if (fetchResult.lastObject != nil) {
            
            var lastAsset: PHAsset = fetchResult.lastObject as! PHAsset
            
            let arrayToDelete = NSArray(object: lastAsset)
            
            PHPhotoLibrary.shared().performChanges( {
                PHAssetChangeRequest.deleteAssets(arrayToDelete)},
                                                                completionHandler: {
                                                                    success, error in
                        
            })
            
            
            
        }
    }
}
