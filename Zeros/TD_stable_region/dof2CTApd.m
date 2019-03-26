function lambda = dof2CTApd(x, tau)
N=10;
kp1 = x(1); kp2 = x(2); kd1 = x(3); kd2 = x(4);

dtau=tau/N;
C=1/dtau;

A=[zeros(1,2*N+2),1,zeros(1,2*N+1);
  [C*eye(N-1),zeros(N-1,1)]+[zeros(N-1,1),-C*eye(N-1)],zeros(N-1,3*N+4);
  zeros(1,N-1),C,-C,zeros(1,3*N+3);
     
  zeros(1,3*N+3),1,zeros(1,N);
  zeros(N-1,N+1),[C*eye(N-1),zeros(N-1,1)]+[zeros(N-1,1),-C*eye(N-1)],zeros(N-1,2*N+3);
  zeros(1,N+1),zeros(1,N-1),C,-C,zeros(1,2*N+2);
  

  zeros(1,N),-0.1305*kp1,zeros(1,N),0.2715*kp2,zeros(1,N),-0.1305*kd1,zeros(1,N),0.2715*kd2;
  zeros(N-1,2*N+2),[C*eye(N-1),zeros(N-1,1)]+[zeros(N-1,1),-C*eye(N-1)],zeros(N-1,N+2);
  zeros(1,2*N+2),zeros(1,N-1),C,-C,zeros(1,N+1);
  
  zeros(1,N),0.2715*kp1,zeros(1,N),-1.0648*kp2,zeros(1,N),0.2715*kd1,zeros(1,N),-1.0648*kd2;
  zeros(N-1,3*N+3),[C*eye(N-1),zeros(N-1,1)]+[zeros(N-1,1),-C*eye(N-1)],zeros(N-1,1);
  zeros(1,3*N+3),zeros(1,N-1),C,-C];

lambda = max(real(eig(A)));