% Noise analysis Matlab Codes
% Software version: Matlab 2014a
% Author: yoused mafi
% data: 1/20/2022
%-------------------------------------------------------------------------%

clc
clear
close all

% Calculation of environment density matrix of teleportation protocol
density_matrix_environment
% Calculation of input density matrix of teleportation protocol
density_matrix_inputs
% Calculation of noisy density matrix with two different type noise
% The bit-flip and phase-damping noise
bit_flip_and_phase_noises_matrix
% The Amplitude-damping noise
Amplitude_and_phase_noise

%-------------------------------------------------------------------------%
%------------------- plot Amplitude_and_phase_noise Fidelity -------------%
% Noise prameters
k = 0.5;
t = 0.5;
plot_bit_flip_and_phase_noises_matrix

%-------------------------------------------------------------------------%
%------------------- plot Amplitude_and_phase_noise Fidelity -------------%
% Noise prameters
k = 1;
t = 1.5;
plot_Amplitude_and_phase_noise

%-------------------------------------------------------------------------%

clear
% Calculated results
load('U_tel.mat') % The unitary operator of proposed protocol
load('p_in.mat')  % The input density matrix
load('p_en.mat')  % The environment density matrix
load('E_bit_flip_and_phase_noises_matrix.mat') % The noise density matrix
load('Fidelity_bit_flip_and_phase_noises_matrix.mat') % Fidelity 
load('E_Amplitude_and_phase_noise.mat') % The noise density matrix
load('Fidelity_Amplitude_and_phase_noise.mat') % Fidelity 


