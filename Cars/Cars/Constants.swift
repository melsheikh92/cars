//
//  Constants.swift
//  Runner
//
//  Created by Msheikh on 9/20/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
class Constants {
    
    struct  Channels {
        static let book = "Books"
        static let assessment = "BackToBookActivity"
        static let popup = "popup"
    }
    
    struct API {
        static let BOOK_ELEMENT = "/api/v1.0/2/Books/BookElements"
        static let RELATED_ARTICLE = "/api/v1.0/2/RelatedArticlesContent"
        static let LEARNING_MATERIAL = "/api/v1.0/2/Books/ElementLearningMaterials"
        static let EDU_KIT = "/api/v1.0/2/Books/EduKit"
        static let NOTE_CRUD = "/api/v1.0/2/Books/NotesCRUD"
        static let GET_NOTES = "/api/v1.0/2/Books/BookElementNotes"
        static let EDUPEDIA = "/api/v1.0/2/Books/EduPedia" 
    }
    
    struct routs{
        static let ASSESSMENT_ROUTE = "/assessment"
    }
    
    
}

