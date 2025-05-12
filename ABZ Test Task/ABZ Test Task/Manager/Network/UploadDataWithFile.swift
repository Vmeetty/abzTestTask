//
//  UploadDataWithFile.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import UIKit

struct UploadDataWithFile {
    
    enum FileType {
        case image(imageData: Data)
    }
    
    let fileType: FileType
    let imageName: String
    let mimeType: String
    let boundary = UUID().uuidString
    let userData: UserData
    
    var body = NSMutableData()
    
    var data: Data {
        switch fileType {
        case .image(let imageData):
            return imageData
        }
    }
    
    var multipartBodyWithPhoto: Data {
        appendFormField("name", userData.name)
        appendFormField("email", userData.email)
        appendFormField("phone", "380500740599")
        appendFormField("position_id", "\(userData.position_id)")
        body.append(string: "--\(boundary)\r\n")
        body.append(string: "Content-Disposition: form-data; name=\"photo\"; filename=\"\(imageName+".jpeg")\"\r\n")
        body.append(string: "Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.append(string: "\r\n")
        body.append(string: "--\(boundary)--\r\n")
        return body as Data
    }
    
    
    init(userData: UserData, imageName: String, imageData: Data) {
        self.userData = userData
        self.fileType = .image(imageData: imageData)
        self.imageName = imageName.deletingPathExtension
        self.mimeType = "image/jpeg"
    }
    
    func appendFormField(_ name: String, _ value: String) {
        body.append(string: "--\(boundary)\r\n")
        body.append(string: "Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        body.append(string: "\(value)\r\n")
    }
}
