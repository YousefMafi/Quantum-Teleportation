v0 = [1;0];     % |0>
v1 = [0;1];     % |1>

v00 = kron(v0,v0);     % |00>
v01 = kron(v0,v1);     % |01>
v10 = kron(v1,v0);     % |10>
v11 = kron(v1,v1);     % |11>

v000 = kron(v0,v00);     % |000>
v001 = kron(v0,v01);     % |001>
v010 = kron(v0,v10);     % |010>
v011 = kron(v0,v11);     % |011>
v100 = kron(v1,v00);     % |100>
v101 = kron(v1,v01);     % |101>
v110 = kron(v1,v10);     % |110>
v111 = kron(v1,v11);     % |111>

GHZ_ABC = (1/sqrt(2)).*(v000+v111);     % |GHZ> ABC
GHZ_ABC_m = (1/sqrt(2)).*(v000-v111);

phi_pluse = (1/sqrt(2)).*(v00+v11);     % |phi+> ab
phi_minus = (1/sqrt(2)).*(v00-v11);     % |phi-> ab
sai_pluse = (1/sqrt(2)).*(v01+v10);     % |sai+> ab
sai_minus = (1/sqrt(2)).*(v01-v10);     % |sai-> ab

ket_p = (1/sqrt(2)).*(v0+v1);     % |+>
ket_m = (1/sqrt(2)).*(v0-v1);     % |->

ket_pp = kron(ket_p,ket_p);     % |++>
ket_pm = kron(ket_p,ket_m);     % |+->
ket_mp = kron(ket_m,ket_p);     % |-+>
ket_mm = kron(ket_m,ket_m);     % |-->

ket_ppp = kron(ket_p,ket_pp);     % |+++>
ket_ppm = kron(ket_p,ket_pm);     % |++->
ket_pmp = kron(ket_p,ket_mp);     % |+-+>
ket_pmm = kron(ket_p,ket_mm);     % |+-->
ket_mpp = kron(ket_m,ket_pp);     % |-++>
ket_mpm = kron(ket_m,ket_pm);     % |-+->
ket_mmp = kron(ket_m,ket_mp);     % |--+>
ket_mmm = kron(ket_m,ket_mm);     % |--->

%-------------------------------------------------------------------------%
% Input Qubits |BELL>ab |GHZ>ABC
I0000 = kron(phi_pluse,(v000+v111));
I0001 = kron(phi_pluse,(v100+v011));
I0010 = kron(phi_pluse,(v011-v100));
I0011 = kron(phi_pluse,(v000-v111));
I0100 = kron(sai_pluse,(v000+v111));
I0101 = kron(sai_pluse,(v100+v011));
I0110 = kron(sai_pluse,(v011-v100));
I0111 = kron(sai_pluse,(v000-v111));
I1000 = kron(sai_minus,(v000+v111));
I1001 = kron(sai_minus,(v100+v011));
I1010 = kron(sai_minus,(v011-v100));
I1011 = kron(sai_minus,(v000-v111));
I1100 = kron(phi_pluse,(v000+v111));
I1101 = kron(phi_pluse,(v100+v011));
I1110 = kron(phi_pluse,(v011-v100));
I1111 = kron(phi_pluse,(v000-v111));

% Output Qubits ab ABC
W0000 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_ppp+ket_pmm))+kron(sai_pluse,(ket_mpm+ket_mmp)));
W0001 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_ppp+ket_pmm))-kron(sai_pluse,(ket_mpm+ket_mmp)));
W0010 = (1/(2*sqrt(2))).*(kron(sai_pluse,(ket_mpp+ket_mmm))-kron(phi_pluse,(ket_ppm+ket_pmp)));
W0011 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_ppm+ket_pmp))+kron(sai_pluse,(ket_mpp+ket_mmm)));
W0100 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_ppp+ket_pmm))-kron(sai_minus,(ket_mpm+ket_mmp)));
W0101 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_ppp+ket_pmm))+kron(sai_minus,(ket_mpm+ket_mmp)));
W0110 = (1/(2*sqrt(2))).*(-kron(phi_minus,(ket_ppm+ket_pmp))-kron(sai_minus,(ket_mpp+ket_mmm)));
W0111 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_ppm+ket_pmp))-kron(sai_minus,(ket_mpp+ket_mmm)));
W1000 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_mpm+ket_mmp))-kron(sai_minus,(ket_ppp+ket_pmm)));
W1001 = (1/(2*sqrt(2))).*(-kron(phi_minus,(ket_mpm+ket_mmp))-kron(sai_minus,(ket_ppp+ket_pmm)));
W1010 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_mpp+ket_mmm))+kron(sai_minus,(ket_ppm+ket_pmp)));
W1011 = (1/(2*sqrt(2))).*(kron(phi_minus,(ket_mpp+ket_mmm))-kron(sai_minus,(ket_ppm+ket_pmp)));
W1100 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_mpm+ket_mmp))+kron(sai_pluse,(ket_ppp+ket_pmm)));
W1101 = (1/(2*sqrt(2))).*(kron(sai_pluse,(ket_ppp+ket_pmm))-kron(phi_pluse,(ket_mpm+ket_mmp)));
W1110 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_mpp+ket_mmm))-kron(sai_pluse,(ket_ppm+ket_pmp)));
W1111 = (1/(2*sqrt(2))).*(kron(phi_pluse,(ket_mpp+ket_mmm))+kron(sai_pluse,(ket_ppm+ket_pmp)));

% U_tel = Sum (|W_hijk><I_hijk|)
U_tel = W0000*I0000'+W0001*I0001'+W0010*I0010'+W0011*I0011'+W0100*I0100'...
       +W0101*I0101'+W0110*I0110'+W0111*I0111'+W1000*I1000'+W1001*I1001'...
       +W1010*I1010'+W1011*I1011'+W1100*I1100'+W1101*I1101'+W1110*I1110'...
       +W1111*I1111';
 save('U_tel.mat','U_tel')  
%-------------------------------------------------------------------------%
% density matrix environment
p_en = GHZ_ABC*(conj(GHZ_ABC'));
save('p_en.mat','p_en') 
%-------------------------------------------------------------------------%




