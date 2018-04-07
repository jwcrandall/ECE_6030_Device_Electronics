%Variation of Ideal diode I-V characteristics with termperature
%Initialization and Universal constants
clear;
k=8.617e-5;
q=1.6e-19;

%Device, Material, and System Parameters
A=1.0e-4;
ND=1.0e16;
taup=1.0e-6;
T=300:1:400;

%Calculation of ni using ni fit relation
ni=(9.15e19).*(T./300).^2.*exp(-0.5928./(k*T));

%Parameter values at 300K termperature
NAref300=2.35e17;
upmin300=54.3;
up0300=406.9;
ap300=0.88;

%Calculation of parameter values at desired termperature
NAref=NAref300.*(T/300).^(2.4);
upmin=NAref300.*(T/300).^(-0.57);
up0=NAref300.*(T/300).^(-2.23);
ap=NAref300.*(T/300).^(-0.146);

%Calculation of hole mobility using empirical-fit relationship
up=upmin+up0./(1+(ND./NAref).^ap);

%Calculation of I,V and generation of plots.
VA=linspace(-1,0.2);
DP=k.*T.*up;
LP=sqrt(DP.*taup);
I0=q.*A.*(DP./LP).*(ni.^2./ND);
semilogy(T,I0);
xlabel('T(Kelvin)');
ylabel('I0(amp)');

