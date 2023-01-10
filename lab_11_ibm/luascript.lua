for i = 0,5,1
do
ei_addnode(70 + i * 24,99)
ei_addnode(70 + i * 24,49)
ei_addnode(85 + i * 24,99)
ei_addnode(85 + i * 24,49)
ei_addsegment(70 + i * 24,49,70 + i * 24,99)
ei_addsegment(70 + i * 24,99,85 + i * 24,99)
ei_addsegment(85 + i * 24,99,85 + i * 24,49)
ei_addsegment(85 + i * 24,49,70 + i * 24,49)
end

ei_addnode(10,0)
ei_addnode(10,15)
ei_addnode(70,15)
ei_addsegment(10,0,10,15)
ei_addsegment(10,15,70,15)
for i = 0,4,1
do
ei_addnode(70 + i * 36,45)
ei_addnode(85 + i * 36,45)
ei_addnode(85 + i * 36,15)
ei_addnode(70 + (i + 1) * 36,15)
ei_addsegment(70 + i * 36,15,70 + i * 36,45)
ei_addsegment(70 + i * 36,45,85 + i * 36,45)
ei_addsegment(85 + i * 36,45,85 + i * 36,15)
ei_addsegment(85 + i * 36,15,70 + (i + 1) * 36,15)
end
ei_addnode(301,15)
ei_addnode(301,0)
ei_addsegment(250,15,301,15)
ei_addsegment(301,15,301,0)

ei_selectgroup(0)
ei_mirror(0,0,200,0,1)

--belka wystająca z lewej i prawej powinna mieć 30 wysokości i 60 szerokości na boki
--teraz trzeba dodać labele do każdego z osobna zamkniętego okienka ;/