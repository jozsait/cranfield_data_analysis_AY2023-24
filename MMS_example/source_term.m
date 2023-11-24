function my_source = source_term(x,y,t,D,U,V,Lx,Ly,MS)

if MS == true
    % wave numbers to satisfy BCs
    k_x = pi/Lx;
    k_y = pi/Ly;
%     syms t x y;
%     
%     
%     C_ms=sin(k_x*x)*sin(k_y*y)*t^2;
%     
%     T1 = diff(C_ms,t,1);
%     T2 = U*diff(C_ms,x);
%     T3 = V*diff(C_ms,y);
%     T4 = -D*diff(C_ms,x,2);
%     T5 = -D*diff(C_ms,y,2);
%     
%     S_ms = T1 + T2 + T3 + T4 + T5;
%     
%     
%     my_source = zeros(size(X));
%     for i = 1:size(X,1)
%         for j = 1:size(X,2)
%             my_source(i,j) = subs( S_ms, [x,y,t],...
%                 [X(i,j),Y(i,j),td]);
%         end
%     end
my_source = 2*t*sin(k_x*x).*sin(k_y*y) +...
    k_x^2*t^2*sin(k_x*x).*sin(k_y*y) +...
    k_y^2*t^2*sin(k_x*x).*sin(k_y*y) +...
    k_x*t^2*cos(k_x*x).*sin(k_y*y) +...
    (k_y*t^2*cos(k_y*y).*sin(k_x*x))/2;

else
    my_source = zeros(size(X));
end

