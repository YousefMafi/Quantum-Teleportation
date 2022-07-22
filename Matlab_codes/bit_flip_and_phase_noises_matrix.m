syms ta tb pa pb y1 y3 t0
%-------------------------------------------------------------------------%
% bit-flip and phase noise     theta_b = 0;

E_bf_pn(1,1) = (1/4)*(1+exp(-2*y1*t0));
E_bf_pn(1,2) = 0;
E_bf_pn(1,3) = 0;
E_bf_pn(1,4) = (1/4)*((exp(-2*y3*t0))*(1+exp(-2*y1*t0)));

E_bf_pn(2,1) = 0;
E_bf_pn(2,2) = (1/4)*(1-exp(-2*y1*t0));
E_bf_pn(2,3) = (1/4)*((exp(-2*y3*t0))*(1-exp(-2*y1*t0)));
E_bf_pn(2,4) = 0;

E_bf_pn(3,1) = 0;
E_bf_pn(3,2) = (1/4)*((exp(-2*y3*t0))*(1-exp(-2*y1*t0)));
E_bf_pn(3,3) = (1/4)*(1-exp(-2*y1*t0));
E_bf_pn(3,4) = 0;

E_bf_pn(4,1) = (1/4)*((exp(-2*y3*t0))*(1+exp(-2*y1*t0)));
E_bf_pn(4,2) = 0;
E_bf_pn(4,3) = 0;
E_bf_pn(4,4) = (1/4)*(1+exp(-2*y1*t0));


E_p_in_bit_flip = p_in.*E_bf_pn;

E_p_out_bit_flip = kron(E_p_in_bit_flip,p_en);

save('E_bit_flip_and_phase_noises_matrix.mat','E_p_in_bit_flip','E_p_out_bit_flip') 
%-------------------------------------------------------------------------%
% Fidelity
Tr_p_out(1,1) = trace(E_p_out_bit_flip(1:8,1:8));
Tr_p_out(1,2) = trace(E_p_out_bit_flip(1:8,9:16));
Tr_p_out(1,3) = trace(E_p_out_bit_flip(1:8,17:24));
Tr_p_out(1,4) = trace(E_p_out_bit_flip(1:8,25:32));

Tr_p_out(2,1) = trace(E_p_out_bit_flip(9:16,1:8));
Tr_p_out(2,2) = trace(E_p_out_bit_flip(9:16,9:16));
Tr_p_out(2,3) = trace(E_p_out_bit_flip(9:16,17:24));
Tr_p_out(2,4) = trace(E_p_out_bit_flip(9:16,25:32));

Tr_p_out(3,1) = trace(E_p_out_bit_flip(17:24,1:8));
Tr_p_out(3,2) = trace(E_p_out_bit_flip(17:24,9:16));
Tr_p_out(3,3) = trace(E_p_out_bit_flip(17:24,17:24));
Tr_p_out(3,4) = trace(E_p_out_bit_flip(17:24,25:32));

Tr_p_out(4,1) = trace(E_p_out_bit_flip(25:32,1:8));
Tr_p_out(4,2) = trace(E_p_out_bit_flip(25:32,9:16));
Tr_p_out(4,3) = trace(E_p_out_bit_flip(25:32,17:24));
Tr_p_out(4,4) = trace(E_p_out_bit_flip(25:32,25:32));

F1 = (BELL_ab')*(Tr_p_out)*(BELL_ab);
F2 = subs(F1,tb,0);
Fidelity = subs(F2,pb,0);
Fidelity_bit_flip = subs(Fidelity,pa,0);

save('Fidelity_bit_flip_and_phase_noises_matrix.mat','Fidelity_bit_flip')



