syms ta tb pa pb y y1 y3 t0
%-------------------------------------------------------------------------%
% bit-flip and phase noise     tetha_b = pi;

E_bf_pn(1,1) = (1/2);
E_bf_pn(1,2) = 0;
E_bf_pn(1,3) = 0;
E_bf_pn(1,4) = (1/2)*(exp(-y*t0/2));

E_bf_pn(2,1) = 0;
E_bf_pn(2,2) = 0;
E_bf_pn(2,3) = 0;
E_bf_pn(2,4) = 0;

E_bf_pn(3,1) = 0;
E_bf_pn(3,2) = 0;
E_bf_pn(3,3) = (1/2)*(1-exp(-y*t0));
E_bf_pn(3,4) = 0;

E_bf_pn(4,1) = (1/2)*(exp(-y*t0/2));
E_bf_pn(4,2) = 0;
E_bf_pn(4,3) = 0;
E_bf_pn(4,4) = (1/2)*exp(-y*t0);


E_p_in_Amplitude = p_in.*E_bf_pn;

E_p_out_Amplitude = kron(E_p_in_Amplitude,p_en);

save('E_Amplitude_and_phase_noise.mat','E_p_in_Amplitude','E_p_out_Amplitude') 
%-------------------------------------------------------------------------%
% Fidelity
Tr_p_out(1,1) = trace(E_p_out_Amplitude(1:8,1:8));
Tr_p_out(1,2) = trace(E_p_out_Amplitude(1:8,9:16));
Tr_p_out(1,3) = trace(E_p_out_Amplitude(1:8,17:24));
Tr_p_out(1,4) = trace(E_p_out_Amplitude(1:8,25:32));

Tr_p_out(2,1) = trace(E_p_out_Amplitude(9:16,1:8));
Tr_p_out(2,2) = trace(E_p_out_Amplitude(9:16,9:16));
Tr_p_out(2,3) = trace(E_p_out_Amplitude(9:16,17:24));
Tr_p_out(2,4) = trace(E_p_out_Amplitude(9:16,25:32));

Tr_p_out(3,1) = trace(E_p_out_Amplitude(17:24,1:8));
Tr_p_out(3,2) = trace(E_p_out_Amplitude(17:24,9:16));
Tr_p_out(3,3) = trace(E_p_out_Amplitude(17:24,17:24));
Tr_p_out(3,4) = trace(E_p_out_Amplitude(17:24,25:32));

Tr_p_out(4,1) = trace(E_p_out_Amplitude(25:32,1:8));
Tr_p_out(4,2) = trace(E_p_out_Amplitude(25:32,9:16));
Tr_p_out(4,3) = trace(E_p_out_Amplitude(25:32,17:24));
Tr_p_out(4,4) = trace(E_p_out_Amplitude(25:32,25:32));

F1 = (BELL_ab')*(Tr_p_out)*(BELL_ab);
F2 = subs(F1,tb,0);
Fidelity = subs(F2,pb,0);
Fidelity_Amplitude = subs(Fidelity,pa,0);

save('Fidelity_Amplitude_and_phase_noise.mat','Fidelity_Amplitude') 


