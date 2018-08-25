// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

// Implementation of Equatable protocol
//
//func ==(lhs: Friendable, rhs: Friendable) -> Bool {
//    return lhs.friendID == rhs.friendID
//}

// MARK: - Likeable Protocol

/// Provides methods and properties that determine likeability
protocol Likeable
{
    // MARK: Property Declaration
    var numberOfLikes: Int { get }
    
    // MARK: Method Declarations
    func like()
    func unlike()
}

// MARK: - Friendable Protocol
protocol Friendable
{
    // MARK: Property Declarations
    var friendID: Int { get }
    var friends: [Friendable] { get }
    
    // MARK: Method Declarations
    func friend(_ newFriend: Friendable)
    func unfriend(_ oldFriend: Friendable)
}

// MARK: - Person Class
class Person: CustomDebugStringConvertible
{
    // MARK: Person Properties
    var firstName: String
    var lastName: String
    
    // MARK: Likeable Properties
    var numberOfLikes = 0
    
    // MARK: Friendable Properties
    var friendID = 0
    var friends = [Friendable]()
    
    // MARK: CustomDebugStringConvertible Properties
    var debugDescription: String {
        return "\(firstName) \(lastName), +\(numberOfLikes)"
    }
    
    // MARK: - Initializers
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}


// MARK: - Person's Likeable Methods
extension Person : Likeable
{
    func like() {
        numberOfLikes += 1
    }
    
    func unlike() {
        if (numberOfLikes > 0) {
            numberOfLikes -= 1
        }
    }
}


func ==(lhs: Friendable, rhs: Friendable) -> Bool {
    return lhs.friendID == rhs.friendID
}

func !=(lhs: Friendable, rhs: Friendable) -> Bool {
    return lhs.friendID != rhs.friendID
}

// MARK: - Person's Friendable Methods
extension Person: Friendable
{
    func friend(_ newFriend: Friendable) {
        friends.append(newFriend)
    }
    
    func unfriend(_ oldFriend: Friendable) {
        friends = friends.filter { currFriend in
            return currFriend != oldFriend
        }
    }
    
    func unfriend2(_ oldFriend: Friendable) {
        guard let index = friends.index(where: { oldFriend == $0 }) else { return }
        friends.remove(at: index)
    }
}
















