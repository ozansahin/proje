showconsole()
mydir="./"
open(mydir .. "EE564.fem")
mi_saveas(mydir .. "temp.fem")
mi_seteditmode("group")
for n=0,15 do
	mi_analyze()
	mi_loadsolution()
	mo_groupselectblock(1)
	fz=mo_blockintegral(22)
	print((15-n)/10,fz)
	if (n<15) then
		mi_selectgroup(1)
    	mi_movetranslate(0,0.1)
	end
end
mo_close()
mi_close()