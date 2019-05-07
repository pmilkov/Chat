//
//  Constants.swift
//  Chat
//
//  Created by Michelle Neidhart on 2/8/19.
//  Copyright © 2019 ChatApplication. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
        static let databaseCSCI270M01 = databaseChats.child("CSCI270-M01")
        static let databaseCSCI270M02 = databaseChats.child("CSCI270-M02")
        static let databaseCSCI318M01 = databaseChats.child("CSCI318-M01")
        static let databaseCSCI318M02 = databaseChats.child("CSCI318-M02")
        static let databaseICPH305M01 = databaseChats.child("ICPH305-M01")
        static let databaseICPH305M02 = databaseChats.child("ICPH305-M02")
        static let databaseIENG400M01 = databaseChats.child("IENG400-M01")
        static let databaseIENG400M02 = databaseChats.child("IENG400-M02")
    }
}
