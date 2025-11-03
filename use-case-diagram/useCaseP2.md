@startuml Profile_Management
top to bottom direction
skinparam packageStyle rectangle

actor "Authenticated user" as LoggedInUser
actor "Student" as Student
actor "Tutor" as Tutor

LoggedInUser <|-- Student
LoggedInUser <|-- Tutor

rectangle "Profile and Account Management" {
  usecase (Logout) as UC_LOGOUT
  usecase (Change language) as UC_LANG
  
  package "Profile Operations" {
    usecase (Manage own profile) as UC_PROF
    usecase (View profile information) as UC_VIEW_PROF
    usecase (Edit profile information) as UC_EDIT_PROF
  }
  
  usecase (Request profile changes) as UC_REQ_CHANGE
}

LoggedInUser --> UC_LOGOUT
LoggedInUser --> UC_LANG
LoggedInUser --> UC_PROF

Tutor --> UC_REQ_CHANGE

UC_PROF ..> UC_VIEW_PROF : <<include>>
UC_PROF ..> UC_EDIT_PROF : <<include>>
UC_REQ_CHANGE ..> UC_EDIT_PROF : <<extend>>

@enduml