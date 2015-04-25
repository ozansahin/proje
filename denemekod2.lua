showconsole()
mydir="./"
open(mydir .. "EE564.fem")
mi_saveas(mydir .. "temp.fem")
mi_seteditmode("group")
for n=1,20 do
	mi_analyze()
	mi_loadsolution()
	mo_groupselectblock(1)
	rz=mo_blockintegral(18)
	ry=mo_blockintegral(19)-0.4
	if (n<20) then
		mi_selectgroup(1)
    	mi_movetranslate(rz*n*n/100,ry*n*n/100)
	end
end

mi_close()
mo_close()
