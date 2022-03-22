clc
clear
close all

kt = 0:0.1:8;

F_av_Amplitude_and_phase_noise = (exp(-2*kt)/3+0.73)+(1-max(exp(-2*kt)/3+0.73));
F_av_bit_flip_and_phase_noises_matrix = exp(-kt)/3+2/3;

plot(kt,F_av_Amplitude_and_phase_noise,'r','LineWidth',2)
hold on
plot(kt,F_av_bit_flip_and_phase_noises_matrix,'b','LineWidth',2)
xlabel('\kappa.t','fontname','times','FontSize',12)
ylabel('Average Fidelity','fontname','times','FontSize',12)
legend('Fidelity_{av} (Amplitude and phase noise)','Fidelity_{av} (Bit-flip and phase noise)','fontname','times','FontSize',12)