function sse = sumsquarederrors(fun,params,sizes)

    [f,x]=ecdf(sizes);
    
    y=fun(x,params(1),params(2));
    
    sse=sum((y-f).^2);

end