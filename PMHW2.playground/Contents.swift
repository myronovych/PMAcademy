import UIKit

typealias Bet = String
typealias Username = String

enum SystemError: Error {
    case usernameIsTaken
    case invalidCredentials
    case alreadyLoggedOut
    case userIsBanned
    case noRightsForThisAction
    case alreadyLoggedIn
}

enum Role {
    case admin
    case regularUser
}

class User {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

class RegularUser: User {
    var isBanned = false
}

class Admin: User {
    
}

struct BettingSystem {
    private var users: [Username: User]
    private var bets: [Username: [Bet]]
    private var authorized: User?
    
    init(users: [Username: User] = [:], bets: [Username: [Bet]] = [:], authorized: User? = nil) {
        self.users = users
        self.bets = bets
        self.authorized = authorized
    }
    
    mutating func register(username: Username, password: String, role: Role) throws {
        if authorized != nil {
            print("You have to log out before registering.")
            return
        }
        
        if users[username] != nil {
            print("This username is already taken")
            throw SystemError.usernameIsTaken
        } else {
            if role == .admin {
                users[username] = Admin(username: username, password: password)
            } else {
                users[username] = RegularUser(username: username, password: password)
                bets[username] = []
            }
            print("Successfull registered \(role) \(username)")
        }
    }
    
    mutating func login(user: User) throws {
        guard let user = users[user.username] else {
            print("Incorrect credentials")
            throw SystemError.invalidCredentials
        }
        
        if let regUser = user as? RegularUser, regUser.isBanned {
            print("You are banned, sorry")
            throw SystemError.userIsBanned
        }
        
        authorized = user
        print("Successfull login for \(user.username)")
        
    }
    
    mutating func logout() throws {
        guard let user = authorized else {
            print("Nobody is logged in.")
            throw SystemError.alreadyLoggedOut
        }
        
        authorized = nil
        print("Successful logout for \(user.username).")
    }
    
    mutating func placeBet(_ bet: Bet) throws {
        guard let user = authorized as? RegularUser else {
            print("You can not place a bet")
            throw SystemError.noRightsForThisAction
        }
        
        bets[user.username]?.append(bet)
        print("\(user.username) have placed a bet \(bet)")
    }
    
    mutating func printListOfUsers() throws {
        guard let _ = authorized as? Admin else {
            print("You are not authorized to get list of users")
            throw SystemError.noRightsForThisAction
        }
        
        print("List of users: ")
        var regularUsers = [Username]()
        for username in users.keys {
            if let regularUser = users[username] as? RegularUser {
                regularUsers.append(regularUser.username)
            }
        }
        print(regularUsers)
    }
    
    mutating func printMyBets() throws {
        guard let user = authorized as? RegularUser else {
            print("You cant do that action")
            throw SystemError.noRightsForThisAction
        }
        
        print("Your bets: ")
        print(bets[user.username] ?? "No bets yet")
    }
    
    mutating func banRegularUser(username: Username) throws {
        guard let _ = authorized as? Admin else {
            print("You are not authorized to ban user")
            throw SystemError.noRightsForThisAction
        }
        
        guard let user = users[username] as? RegularUser else {
            print("You are not authorized to ban user")
            throw SystemError.noRightsForThisAction
        }
        
        if user.isBanned {
            print("User is already banned")
            return
        }
        
        user.isBanned = true
        users[username] = user
        print("User \(user.username) was banned")
    }
}

// TESTING

var system = BettingSystem()

//test accounts
let alex = User(username: "alex", password: "1234")
let adminPasha = User(username: "adminAndrey", password: "yaKrutoiAdmin")

print("-----------Nobody is authorized in system--------")
try? system.placeBet("Real - Barca: W1 - 2.45")
try? system.placeBet("Ukraine - Spain: W1 - 4.5")
try? system.printMyBets()
try? system.banRegularUser(username: "alex")
try? system.printListOfUsers()


print("--------------Registering regular user------------------")
try? system.login(user: alex)
try? system.register(username: "alex", password: "1234", role: .regularUser)
try? system.login(user: alex)
try? system.placeBet("Real - Barca: W1 - 2.45")
try? system.placeBet("Ukraine - Spain: W1 - 4.5")
try? system.printMyBets()

//should not pass
try? system.banRegularUser(username: "alex")
try? system.printListOfUsers()


print("--------------Registering admin------------------")
try? system.register(username: "adminAndrey", password: "yaKrutoiAdmin", role: .admin)
try? system.login(user: adminPasha)

try? system.logout()

//user with this username already exists
try? system.register(username: "alex", password: "yaKrutoiAdmin", role: .admin)

try? system.register(username: "adminAndrey", password: "yaKrutoiAdmin", role: .admin)
try? system.login(user: adminPasha)

try? system.banRegularUser(username: "alex")
try? system.printListOfUsers()
try? system.logout()


print("-------Loging in banned user------")
try? system.login(user: alex)
