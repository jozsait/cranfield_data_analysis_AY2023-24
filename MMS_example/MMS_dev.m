syms t x y k_x k_y;

C_ms=sin(k_x*x)*sin(k_y*y)*t^2;

T1 = diff(C_ms,t,1);
T2 = U*diff(C_ms,x);
T3 = V*diff(C_ms,y);
T4 = -D*diff(C_ms,x,2);
T5 = -D*diff(C_ms,y,2);

S_ms = T1 + T2 + T3 + T4 + T5
