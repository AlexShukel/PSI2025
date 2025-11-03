@startuml Search_Materials
top to bottom direction
skinparam packageStyle rectangle

actor "Unauthenticated user" as Anon
actor "Authenticated user" as LoggedInUser
actor "Student" as Student
actor "Tutor" as Tutor

LoggedInUser <|-- Student
LoggedInUser <|-- Tutor

rectangle "Search" {
  usecase (Search and view tutors) as UC_SEARCH
  usecase (Filter by criteria) as UC_FILTER
  usecase (View tutor profile) as UC_VIEW_TUT
  usecase (View public materials) as UC_VIEW_MAT_PUB
}

rectangle "Learning Materials Management" {
  usecase (Manage learning material) as UC_MAT
  usecase (Upload material) as UC_UPLOAD_MAT
  usecase (Set access permissions) as UC_SET_PERM
  usecase (View assigned materials) as UC_VIEW_ASSIGN
}

Anon --> UC_SEARCH
LoggedInUser --> UC_SEARCH

LoggedInUser --> UC_VIEW_TUT

Student --> UC_VIEW_ASSIGN
Tutor --> UC_MAT

UC_SEARCH ..> UC_FILTER : <<include>>
UC_VIEW_MAT_PUB ..> UC_SEARCH : <<extend>>

UC_MAT ..> UC_UPLOAD_MAT : <<include>>
UC_MAT ..> UC_SET_PERM : <<include>>

@enduml