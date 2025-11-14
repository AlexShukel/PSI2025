@startuml Search_Materials
top to bottom direction
skinparam packageStyle rectangle
skinparam monochrome true

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
    usecase (View learning materials) as UC_VIEW_MAT
    
  rectangle "Tutor Management" {
    usecase (Set access permissions) as UC_SET_PERM
    usecase (Upload material) as UC_UPLOAD_MAT
    usecase (Edit uploaded material) as UC_EDIT_MAT
  }
}

Anon -- UC_SEARCH
LoggedInUser -- UC_SEARCH

Student -- UC_VIEW_MAT
Tutor -- UC_VIEW_MAT

UC_SEARCH <.. UC_FILTER : <<extend>>
UC_VIEW_MAT_PUB ..> UC_SEARCH : <<extend>>
UC_VIEW_TUT ..> UC_SEARCH : <<extend>>

UC_UPLOAD_MAT ..> UC_VIEW_MAT : <<extend>>
UC_SET_PERM ..> UC_VIEW_MAT : <<extend>>
UC_EDIT_MAT ..> UC_VIEW_MAT : <<extend>>


@enduml