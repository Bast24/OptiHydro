// Premier oracle (fonction + gradient)
function [F,G,ind] = OraclePG(qc, ind)
    q = q0+B*qc;
    if ind == 2 then
        F = (1/3)*q'*(r.*q.*abs(q)) + pr'*(Ar*q); 
        G = zeros(n-md,1);
        
    elseif ind == 3 then
        F = 0;
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        
    else
        F = (1/3)*q'*(r.*q.*abs(q)) + pr'*(Ar*q); 
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        
    end
endfunction

// Second oracle (fonction + gradient + hessienne)
function [F,G,H,ind] = OraclePH(qc, ind)
    q = q0+B*qc;
    if ind == 2 then
        F = (1/3)*q'*(r.*q.*abs(q)) + pr'*(Ar*q); 
        G = zeros(n-md,1);
        H = zeros(n-md,n-md);
        
    elseif ind == 3 then
        F = 0;
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        H = zeros(n,n);
        
    elseif ind == 4 then
        F = (1/3)*q'*(r.*q.*abs(q)) + pr'*(Ar*q); 
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        H = zeros(n-md,n-md);
        
    elseif ind == 5 then
        F = 0;
        G = zeros(n-md,1);
        H = 2*B'*diag(r.*abs(q))*B;
        
    elseif ind == 6 then
        F = 0;
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        H = 2*B'*diag(r.*abs(q))*B;
        
    elseif ind == 7 then
        F = (1/3)*q'*(r.*q.*abs(q)) + pr'*(Ar*q);
        G = B'*((r.*q.*abs(q)) + Ar'*pr);
        H = 2*B'*diag(r.*abs(q))*B;
        
    end
endfunction

