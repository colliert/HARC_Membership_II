-- Add New Member
select 
     "Add new member" as Action
     ,call
     ,f_nam
     ,l_nam

from v_hcol_export
where (roster = 'Active' or roster = 'Expiring Soon')
        and
            length(call)>0
        and
            call not in
                        (
                        select pers_call from v_pers where pers_typ_cd = 1
                        )
                        
UNION

-- Change non-member to member
select 
 	"Change non-member to member" as Action
 	,call
	,f_nam
	,l_nam
from v_hcol_export
where (roster = 'Active' or roster = 'Expiring Soon')
		and
		call in
			(
			select pers_call from v_pers where pers_typ_cd = 0
			)

UNION

-- Change member to non-Member
select
	"Change member to non-member" as Action 
 	,pers_call
 	,pers_f_nam
	 ,pers_l_nam
from v_pers 
where pers_typ_cd = 1
		and 
	pers_call not in
		(
		select  call from v_hcol_export
		where (roster = 'Active' or roster = 'Expiring Soon')
		)