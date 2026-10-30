g = 9.81;
QuarterCarMass = 350;
Jw = 1.8;
effR = 0.30;

v0 = 27.78;               % Initial Vehicle Speed [m/s]


omega0 = v0 / effR;       
% omega0 = 0.8 * (v0 / effR);
% omega0 = 0;              

v_epsilon = 0.5;
v_stop = 0.1;
Tmax = 2000;

lambda_ref = 0.20;  % Target Slip Ratio [-]
low_slip = 0.17;    % Low Slip Threshold [-]
high_slip = 0.23;   % High Slip Threshold [-]
Ts = 0.005;         % Controller Sample Time [s]

B = 10;             % Stiffness Factor
C = 1.9;            % Shape Factor
D = 1.0;            % Peak Value (Peak Friction Coefficient)
E = 0.97;           % Curvature Factor

Kp = 100;           % Proportional Gain
Ki = 10;            % Integral Gain 
tau_b = 0.03;       % Actuator Time Constant 

disp('ABS parameters initialized');
