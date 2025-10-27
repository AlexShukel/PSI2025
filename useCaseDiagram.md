@startuml
left to right direction
' ----- actors -----
actor "Neprisijungęs vartotojas" as Anon
actor "Prisijungęs vartotojas"   as LoggedInUser
actor "Mokinys"                  as Student   
actor "Korepetitorius"            as Tutor     
actor "Administratorius"           as Admin     

' ----- hierarchy -----
LoggedInUser <|-- Student
LoggedInUser <|-- Tutor
LoggedInUser <|-- Admin

' ----- system boundary -----
rectangle KOPUS {
  usecase (Prisijungti)                    as UC_LOGIN
  usecase (Registruotis mokiniu)           as UC_REG_ST
  usecase (Pateikti korepetitoriaus\nparaišką) as UC_APP_TUT
  usecase (Ieškoti ir peržiūrėti\nkorepetitorius) as UC_SEARCH
  usecase (Atsijungti)                     as UC_LOGOUT
  usecase (Valdyti savo profilį)           as UC_PROF
  usecase (Rezervuoti pamoką)              as UC_RES
  usecase (Palikti atsiliepimą)             as UC_REV
  usecase (Įsigyti kreditų)                as UC_CRED
  usecase (Registruotis į grupinę pamoką)    as UC_GRP_REG
  usecase (Valdyti rezervacijas)            as UC_MAN_RES
  usecase (Valdyti užimtumo kalendorių)      as UC_CAL
  usecase (Valdyti mokymosi medžiagą)       as UC_MAT
  usecase (Kurti grupines pamokas)           as UC_GRP_CRT
  usecase (Valdyti vartotojus)              as UC_MAN_USR
  usecase (Valdyti korepetitorių\nparaiškas) as UC_MAN_APP
  usecase (Valdyti mokomuosius dalykus)     as UC_MAN_SUB
  usecase (Atkurti slaptažodį)              as UC_RST_PWD
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