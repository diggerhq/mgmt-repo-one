package digger

user_permissions := {
    "motatoes": ["digger unlock", "digger plan", "digger apply"],
    "ZIJ": ["digger unlock", "digger plan" ]
}

veto_list := ["motatoes"]


default allow_action = false
allow_action {
   permissions := user_permissions[input.user]
   p := permissions[_]
   p == input.action
}

default veto = false
veto {
	approvals := input.approvals[_] 
    approvals == veto_list[_]
}

default allow = false
allow {
	allow_action
}
allow {
   veto
}
