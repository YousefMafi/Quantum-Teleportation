syms ta tb pa pb

phi_a = cos(ta/2)*exp(1i*pa/2)*v0 + sin(ta/2)*exp(1i*pa/2)*v1;
phi_b = cos(tb/2)*exp(1i*pb/2)*v0 + sin(tb/2)*exp(1i*pb/2)*v1;
BELL_ab = kron(phi_a,phi_b);

%-------------------------------------------------------------------------%
% density matrix inputs |BELL>ab
p_in = kron(BELL_ab,conj(BELL_ab'));
save('p_in.mat','p_in')

