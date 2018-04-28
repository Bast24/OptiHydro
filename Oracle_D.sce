// Premier oracle (fonction + gradient)
function [F,G,ind] = OracleDG(lmb, ind)
    u = (-Ar'*pr-Ad'*lmb)./r;
    qsharp = sign(u) .* sqrt(abs(u));
    if ind == 2 then
        F = -((1/3)*qsharp'*(r.*qsharp.*abs(qsharp)) + pr'*(Ar*qsharp) + lmb'*(Ad*qsharp-fd));
        G = zeros(md,1);
        
    elseif ind == 3 then
        F = 0;
        G = -(Ad*qsharp-fd);
        
    else
        F = -((1/3)*qsharp'*(r.*qsharp.*abs(qsharp)) + pr'*(Ar*qsharp) + lmb'*(Ad*qsharp-fd));
        G = -(Ad*qsharp-fd);
    end
endfunction

// Second oracle (fonction + gradient + hessienne)
function [F,G,H,ind] = OracleDH(lmb, ind)
    u = (-Ar'*pr-Ad'*lmb)./r;
    qsharp = sign(u) .* sqrt(abs(u));
    if ind == 2 then
        F = -(1./3.*qsharp'*(r.*qsharp.*abs(qsharp)) + pr'*(Ar*qsharp) + lmb'*(Ad*qsharp-fd));
        G = zeros(md,1);
        H = zeros(md,md);
        
    elseif ind == 3 then
        F = 0;
        G = -(Ad*qsharp-fd);
        H = zeros(md,md);
        
    elseif ind == 4 then
        F = -(1./3.*qsharp'*(r.*qsharp.*abs(qsharp)) + pr'*(Ar*qsharp) + lmb'*(Ad*qsharp-fd));
        G = -(Ad*qsharp-fd);
        H = zeros(md,md);
        
    elseif ind == 5 then
        F = 0;
        G = zeros(md,1);
        H = (1./2.)*Ad*diag(1. ./ (r.*sqrt(abs(u))))*Ad';
        
    elseif ind == 6 then
        F = 0;
        G = -(Ad*qsharp-fd);
        H = (1./2.)*Ad*diag(1. ./ (r.*sqrt(abs(u))))*Ad';
        
    elseif ind == 7 then
        F = -(1./3.*qsharp'*(r.*qsharp.*abs(qsharp)) + pr'*(Ar*qsharp) + lmb'*(Ad*qsharp-fd));
        G = -(Ad*qsharp-fd);
        H = (1./2.)*Ad*diag(1. ./ (r.*sqrt(abs(u))))*Ad';
        
    end
endfunction

