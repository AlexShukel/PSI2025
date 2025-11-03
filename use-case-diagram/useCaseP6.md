@startuml Administrative_Operations
top to bottom direction
skinparam packageStyle rectangle

actor "Administrator" as Admin

rectangle "Administrative Operations" {
  
  package "User Management" {
    usecase (Manage users) as UC_MAN_USR
    usecase (View all users) as UC_VIEW_USR
    usecase (Block/Unblock user) as UC_BLOCK_USR
    usecase (Add administrator) as UC_ADD_ADMIN
  }
  
  package "Tutor Application Management" {
    usecase (Manage tutor applications) as UC_MAN_APP
    usecase (Review application) as UC_REV_APP
    usecase (Approve application) as UC_APP_APPR
    usecase (Reject application) as UC_APP_REJ
    usecase (Create tutor account) as UC_CRT_TUT
  }
  
  package "System Configuration" {
    usecase (Manage subjects) as UC_MAN_SUB
  }
  
  package "Support" {
    usecase (Handle disputes) as UC_DISPUTE
  }
}

Admin --> UC_MAN_USR
Admin --> UC_MAN_APP
Admin --> UC_MAN_SUB
Admin --> UC_DISPUTE

UC_MAN_USR ..> UC_VIEW_USR : <<include>>
UC_BLOCK_USR ..> UC_MAN_USR : <<extend>>
UC_ADD_ADMIN ..> UC_MAN_USR : <<extend>>

UC_MAN_APP ..> UC_REV_APP : <<include>>
UC_REV_APP ..> UC_APP_APPR : <<include>>
UC_REV_APP ..> UC_APP_REJ : <<include>>
UC_APP_APPR ..> UC_CRT_TUT : <<include>>

@enduml