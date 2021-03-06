%% Initialization
clc,clear all

%% Constants
Ef=400*1e9;
Em=2.5*1e9;
vfiber=.7;
vmatrix=.3;
E1=Ef*vfiber+Em*vmatrix;
E2=((vfiber/Ef)+(vmatrix/Em))^(-1);
Nu12=.24;
Nu21=Nu12*(E2/E1);
G12=5.65*1e9;
lengthfactor=1e-6
rf=(12/2)*1e-6;
rm=(rf^2/vfiber)^.5;
t=2.0*rm;
Tt=8*t;
zk=[-4*t,-3*t,-2*t,-t,0,t,2*t,3*t,4*t];

Theta=[45,-45,45,-45,45,-45,45,-45];
%Theta=[0,0,0,0,0,0,0,0];

N=[20;20;0]*1e6;
M=[5;5;2]*1e6;
%N=[20;20;5]*1e6;
%M=[0;0;0]*1e6;
%% Qbar_k
for i=1:length(Theta)
    Qbar(i).k=Qbar_k(Theta(i),E1,E2,Nu12,Nu21,G12);
end
Qbar.k

%% A B and D
A=0;
B=0;
D=0;
for i=1:length(Theta)
      Aadd=Qbar(i).k*(zk(i+1)-zk(i));
      A=A+Aadd;
  end
A=A/(8*t)
  for i=1:length(Theta)
      Badd=Qbar(i).k*(zk(i+1)^2-zk(i)^2);
      B=B+Badd;
  end
  B=B/2
  B=B/Tt^2
  
  for i=1:length(Theta)
      Dadd=Qbar(i).k*(zk(i+1)^3-zk(i)^3);
      D=D+Dadd;
  end
  D=D/3
  D=D/Tt^3


%% A* B* C* and D*
Astar=A^-1
Bstar=-Astar*B
Cstar=B*Astar
Dstar=D-B*(A^-1)*B

%% kappa
Kappa=-Dstar^(-1)*Cstar*N*Tt+Dstar^(-1)*M/Tt^2

%% epsilon not
Epsilon_not = Astar*N+Bstar*Kappa*Tt


%% sigma k

for i=1:length(Theta)
    sigma(i).k=Qbar_k(Theta(i),E1,E2,Nu12,Nu21,G12)*Epsilon_not+Qbar_k(Theta(i),E1,E2,Nu12,Nu21,G12)*(zk(i)+t/2)*Kappa;
    sigma(i).k=sigma(i).k/1e9; 
end
sigmak1=sigma(1).k
sigmak2=sigma(2).k
sigmak3=sigma(3).k
sigmak4=sigma(4).k
sigmak5=sigma(5).k
sigmak6=sigma(6).k
sigmak7=sigma(7).k
sigmak8=sigma(8).k

