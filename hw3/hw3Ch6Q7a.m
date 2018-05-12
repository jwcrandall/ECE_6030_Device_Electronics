%Variation of Ideal diode I-V characterisitcs with temperature

%Initialization and Universal constnats
clear
k=8.617e-5;
q=1.6e-19;

%Device, Material, and System Parameters
A=1.0e-4;
ND=1.0e16;
taup=1.0e-6;
T=input('Input the Temperature, T=');

%Calculation of ni using ni fit relation
ni=(9.15e19).*(T./300).^2.*exp(-0.5928./(k*T));

%Parameter valeus at 300K temperature
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
i=length(T);

for a=1:i
I=I0.'*(exp(VA./(k.*T(i)))-1);
close
plot(VA,I);
end
grid;
ymin= -2*max(I0);ymax= 5*max(I0);
axis([-1,0.2,ymin,ymax]);
xlabel('VA(volts)');
ylabel('I(amp)');

%Adding axes, key
xx=[-1 0.2];
yx=[0 0];
xy=[0 0];
yy=[ymin,ymax];
hold on
plot(xx,yx,'-w',xy,yy,'-w');
j=length(T);

for i=1:j
yput=(0.70-0.06*i)*ymax;
yk(i,1)=yput;
yk(i,2)=yput;
text(-0.68,(0.69-0.06*i)*ymax,['T=',num2str(T(i)),'/cm3']);
end
xk=[ -0.8 -0.7];
plot(xk,yk);
text(-0.74,0.75*ymax,'Si,ND=1.0e16/cm3');
hold off














