
##########################################################################
#0
#F  SL2ZmElementsDecomposition
##
##   Decompose a element in SL(2,Z[1/p*n]) into product of 
##   elements in SL(2,Z[1/n]) 
##   and its conjugation by P=[[1,0],[0,p]]
##
##  Input: A matrix g in SL2Z(2,1/pn) 
##         a positive integer p 
##  Output: A list of pairs (a,b) where a in SL2Z(1/n) and b in SL2Z(1/m)^P 
##             
InstallGlobalFunction(SL2ZmElementsDecomposition,
function(g,p)
local i,j,q,k,d,
    S,T,Y,Spr,Tpr,A,B,C,
    l,t,r,m,H,h,K,
    PrimeFactorization,TriangleMatrixDecomposition,InverseOfMatricesList;

    # SL2Z generated by {S,T} or {S,Y}  
    S:=[[0,1],[-1,0]];
    T:=[[1,0],[1,1]];
    Y:=[[0,-1],[1,1]];
    l:=[[1,0],[0,1]];
    t:=[];
    r:=[];
    H:=Group(S);
    K:=Group(Y);


    ###################################################################     
    #1
    #F  PrimeFactorization
    ##
    ##  find the power of p in the prime factorisation of n
    ##
    ##  Input:  A pair of positive integers (n,p)
    ##  Output: the power of p in the prime factorisation of n
    ##
    PrimeFactorization:=function(n,p)       
    local r,k;
    r:=-1;
    k:=n;
    while IsInt(k) do
        r:=r+1;
        k:=k/p;
    od; 
    return r;
    end;
    ###################################################################

    ###################################################################     
    #1
    #F  TriangleMatrixDecomposition
    ##
    ##  Decomposition for a upper triangle matrix with p-factor appears
    ##  in the numerator of (1,1)-entry
    ##
    ##  Input:  A pair of positive integers (n,p)
    ##  Output: the power of p in the prime factorisation of n
    ## 
    TriangleMatrixDecomposition:=function(g,p) 
    local S,T,Spr,r,
        l,q,d,x,id;

        S:=[[0,1],[-1,0]];
        T:=[[1,0],[1,1]];
        Spr:=[[0,p^-1],[-p,0]]; 
        l:=[[1,0],[0,1]];
        d:=[];
        id:=[[1,0],[0,1]];
        while g[1][2]<>0 do
            if g[1][2]*g[2][2]<0 and IsInt(g[2][2]/g[1][2])=false then 
                q:=Int(g[2][2]/g[1][2])-1;
            else 
                q:=Int(g[2][2]/g[1][2]);
            fi;
            l:=T^(-q)*l;
            g:=T^(-q)*g;
            if AbsoluteValue(g[1][2])>AbsoluteValue(g[2][2]) and 
                                                     g[1][2] <> 0 then
                l:=S*l;
                g:=S*g;
            fi;
        od;
        l:=l^-1;
        x:=PrimeFactorization(NumeratorRat(g[1][1]),p);
        r:=[[g[1][1]*p^-x,0],[g[2][1]*p^x,g[2][2]*p^x]];
        while x>0 do
            Append(d,[S^3,Spr]);    
            x:=x-1;
        od;
        d[1]:=l*d[1];
        if r=-id then d[1]:=S^2*d[1];
        else
            if not r=id then Add(d,r);fi;
        fi;
        return d;
    end;
    ###################################################################

    ###################################################################     
    #1
    #F  InverseOfMatricesList
    ##
    ##  Return the inverse of A*B*C as C^-1*B^-1*A^-1
    ##
    ##  Input:  a list of matrices [A,B,C,???]
    ##  Output: a list of inversed matrices 
    ## 
    InverseOfMatricesList:=function(list)    
    local i,n,d;
        n:=Length(list);
        d:=[];
        for i in [1..n] do
            Add(d,list[n-i+1]^-1);
        od;
        return d;
    end;
    ###################################################################
    if p=0 then       # In case of decompose SL(2,Z) into 
                      # product of elements in C4 and C6
        if g=[[1,0],[0,1]] then return [g];fi;
        while g[1][2]<>0 do
            if g[1][1]*g[1][2]<0 and IsInt(g[1][1]/g[1][2])=false then 
                q:=Int(g[1][1]/g[1][2])-1;
            else 
                q:=Int(g[1][1]/g[1][2]);
            fi;
            g:=g*T^(-q);
            q:=-q;
            if q>0 then
                while q>0 do
                    Append(t,[S^3,Y^-1]);
                    q:=q-1;
                od;
            fi;
            if q<0 then
                while q<0 do
                    Append(t,[Y,S^-3]);
                    q:=q+1;
                od;
            fi;
            if AbsoluteValue(g[1][1])<AbsoluteValue(g[1][2]) then
                Add(t,S);
                g:=g*S;
            fi;
        od;
        t:=InverseOfMatricesList(t);
        if g[1][1]>0 then 
            q:=g[2][1];
            if q>0 then
                while q>0 do
        	    Append(r,[S^3,Y^-1]);
          	    q:=q-1;       
                od;
            fi;
            if q<0 then
                while q<0 do
                    Append(r,[Y,S^-3]);
                    q:=q+1;
                od;
            fi;
        else
            Add(r,S^2);
            q:=-g[2][1];
            if q>0 then
                while q>0 do
                    Append(r,[S^3,Y^-1]);
                    q:=q-1;
                od;
            fi;
            if q<0 then
                while q<0 do
                    Append(r,[Y,S^-3]);
                    q:=q+1;
                od;
            fi;
        fi;
        Append(r,t);
        m:=[];
        Add(m,r[1]);
        for i in [2..Length(r)] do
            if r[i]*r[i-1] in H or r[i]*r[i-1] in K then
                m[Length(m)]:=m[Length(m)]*r[i];
            else
                Add(m,r[i]);
            fi;
        od;
        r:=[];
        Add(r,m[1]);
        for i in [2..Length(m)] do
            if m[i]*m[i-1] in H or m[i]*m[i-1] in K then
                r[Length(r)]:=r[Length(r)]*m[i];
            else
                Add(r,m[i]);
            fi;
        od;
        return r;
    else          
    # In case of decompose SL(2,Z[1/p*n]) into product of elements 
    # in SL(2,Z[1/n]) and its conjugation by P=[[1,0],[0,p]]

        if PrimeFactorization(DenominatorRat(g[1][1]),p)
          +PrimeFactorization(DenominatorRat(g[1][2]),p)       
          +PrimeFactorization(DenominatorRat(g[2][1]),p)
          +PrimeFactorization(DenominatorRat(g[2][2]),p)=0 then
            return [g];
        fi;
        Spr:=[[0,p^-1],[-p,0]];
        Tpr:=[[1,0],[p,1]];
        while g[1][1]<>0 do
            if g[1][1]*g[2][1]<0 and IsInt(g[2][1]/g[1][1])=false then 
                q:=Int(g[2][1]/g[1][1])-1;
            else 
                q:=Int(g[2][1]/g[1][1]);
            fi;
            l:=T^(-q)*l;
            g:=T^(-q)*g;
            if AbsoluteValue(g[1][1])>AbsoluteValue(g[2][1]) then
                l:=S*l;
                g:=S*g;
            fi;
        od;
        l:=S*l;
        g:=S*g;
        l:=l^-1;
        k:=PrimeFactorization(NumeratorRat(g[1][1]),p);
        if k>0 then 
            d:=TriangleMatrixDecomposition(g,p);
            d[1]:=l*d[1];
        else 
            d:=TriangleMatrixDecomposition(g^-1,p);
            if d[Length(d)] in SL2Z(p) and not d[Length(d)] 
                        in CongruenceSubgroupGamma0(p) then
                Add(d,l^-1);
                d:=InverseOfMatricesList(d);
            else
                d:=InverseOfMatricesList(d);
                d[1]:=l*d[1];
            fi;
        fi;
        r:=[d[1]];
        for i in [2..Length(d)] do
            if d[i]*d[i-1] in H or d[i]*d[i-1] in K then
                r[Length(r)]:=r[Length(r)]*d[i];
            else
                Add(r,d[i]);
            fi;
        od;
        return r;
    fi;
end);

################### end of SL2ZmElementsDecomposition ######################

