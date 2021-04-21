function [Qbar]=Qbar_k(theta,E1,E2,Nu12,Nu21,G12)
    M2=cosd(theta);
    N2=sind(theta);
    T1=[M2^2,N2^2,2*M2*N2;N2^2,M2^2,-2*M2*N2;-M2*N2,M2*N2,M2^2-N2^2];
    T2=[M2^2,N2^2,M2*N2;N2^2,M2^2,-M2*N2;-2*M2*N2,2*M2*N2,M2^2-N2^2];
    Q=[E1/(1 - Nu12*Nu21), E2*Nu12/(1 - Nu12*Nu21), 0; E2*Nu12/(1 - Nu12*Nu21), E2/(1 - Nu12*Nu21), 0; 0, 0, G12];
    Qbar=[(T1^(-1))*Q*T2];