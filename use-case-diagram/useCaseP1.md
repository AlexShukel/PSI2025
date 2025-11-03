@startuml Authentication_Registration
top to bottom direction
skinparam packageStyle rectangle

actor "Unauthenticated user" as Anon

rectangle "Authentication and Registration" {
  usecase (Login) as UC_LOGIN
  usecase (External authentication) as UC_EXT_AUTH
  usecase (Register as student) as UC_REG_ST
  usecase (Submit tutor application) as UC_APP_TUT
  usecase (Reset password) as UC_RST_PWD
}

Anon --> UC_LOGIN
Anon --> UC_REG_ST
Anon --> UC_APP_TUT
Anon --> UC_RST_PWD

UC_LOGIN ..> UC_EXT_AUTH : <<include>>


@enduml