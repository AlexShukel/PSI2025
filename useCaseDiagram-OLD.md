@startuml
left to right direction
' ----- actors -----
actor "Unauthenticated user" as Anon
actor "Authenticated user"   as LoggedInUser
actor "Student"              as Student   
actor "Tutor"                as Tutor     
actor "Administrator"        as Admin   

' ----- hierarchy -----
LoggedInUser <|-- Student
LoggedInUser <|-- Tutor
LoggedInUser <|-- Admin

' ----- system boundary -----
rectangle KOPUS {
usecase (Login)                              as UC_LOGIN
usecase (Register as student)                as UC_REG_ST
usecase (Submit tutor application)           as UC_APP_TUT
usecase (Search and view tutors)           as UC_SEARCH
usecase (Logout)                             as UC_LOGOUT
usecase (Manage own profile)                 as UC_PROF
usecase (Book a lesson)                      as UC_RES
usecase (Leave feedback)                     as UC_REV
usecase (Buy credits)                     as UC_CRED
usecase (Register for group lesson)        as UC_GRP_REG
usecase (Manage reservations)                 as UC_MAN_RES
usecase (Manage availability calendar)       as UC_CAL
usecase (Manage learning material)          as UC_MAT
usecase (Create group lessons)              as UC_GRP_CRT
usecase (Manage users)                      as UC_MAN_USR
usecase (Manage tutor applications)        as UC_MAN_APP
usecase (Manage subjects)                  as UC_MAN_SUB
usecase (Reset password)                 as UC_RST_PWD
}

' ----- associations -----
Anon        --> UC_LOGIN
Anon        --> UC_REG_ST
Anon        --> UC_APP_TUT
Anon        --> UC_SEARCH
Anon        --> UC_RST_PWD
LoggedInUser --> UC_LOGOUT
LoggedInUser --> UC_PROF
LoggedInUser --> UC_SEARCH
Student     --> UC_RES
Student     --> UC_REV
Student     --> UC_CRED
Student     --> UC_GRP_REG
Tutor       --> UC_MAN_RES
Tutor       --> UC_CAL
Tutor       --> UC_MAT
Tutor       --> UC_GRP_CRT
Admin       --> UC_MAN_USR
Admin       --> UC_MAN_APP
Admin       --> UC_MAN_SUB

' ----- extend / include -----


@enduml