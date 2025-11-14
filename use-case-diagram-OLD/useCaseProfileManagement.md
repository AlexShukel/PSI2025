@startuml Profile_Management
top to bottom direction
skinparam packageStyle rectangle
skinparam monochrome true

actor "Authenticated user" as LoggedInUser
actor "Student" as Student
actor "Tutor" as Tutor

LoggedInUser <|-- Student
LoggedInUser <|-- Tutor

rectangle "Profile and Account Management" {
  usecase (Logout) as UC_LOGOUT
  usecase (Change language) as UC_LANG
  
  rectangle "Profile Operations" {
    usecase (View own profile) as UC_PROF
    usecase (Edit profile information) as UC_EDIT_PROF

  }

  rectangle "Tutor operations" {
    usecase (Request profile changes) as UC_REQ_CHANGE
    usecase (Set maximum number of students) as UC_SET_MAX
  }
  
}

LoggedInUser -- UC_LOGOUT
LoggedInUser -- UC_LANG
LoggedInUser -- UC_PROF

Tutor -- UC_REQ_CHANGE
Tutor -- UC_SET_MAX

UC_PROF <.. UC_EDIT_PROF : <<extend>>
UC_REQ_CHANGE ..> UC_PROF : <<extend>>
UC_SET_MAX ..> UC_PROF : <<extend>>

@enduml