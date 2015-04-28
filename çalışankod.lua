showconsole()
mydir="./"
open(mydir .. "EE564.fem")
mi_saveas(mydir .. "temp.fem")
mi_seteditmode("group")
ilkhizx=0
ilkhizy=0
eylemsizlik=0.000029
rothiz=0
posx= 2.5
posy= 7.5
t=0
for n=0,11 do
	mi_analyze()
	mi_loadsolution()
	mo_groupselectblock(1)
	rz=mo_blockintegral(18)
	ry=mo_blockintegral(19)-1.1
	torque= mo_blockintegral(22)
	rotiv=torque/eylemsizlik
	rothizdeg=rotiv*t
	rothiz=rothiz+rothizdeg
	aci=rothiz*t*180/pi	
	disx= ilkhizx*t+(rz/0.1)*t*t
	disy= ilkhizy*t+(ry/0.1)*t*t
	hizdegx= (rz/0.1)*t
	hizdegy= (ry/0.1)*t
	ilkhizx = ilkhizx+hizdegx
	ilkhizy = ilkhizy+hizdegy
	t=t+0.03
	if (n<10) then
	mi_selectgroup(1)
	mi_moverotate(posx,posy,aci)
	 mi_selectgroup(1)
    	mi_movetranslate(disx,disy)
	posx = posx+disx
	posy=posy+disy
	end
end

mi_close()
mo_close()
