function [a1, b0, b1] = get1stFilterCoeffi(f_cut, ts, isLPF)
    w_cut = 2*pi*f_cut;
    tau = 1/w_cut;
    
    tau_ts = 1/(tau+ts);
    if isLPF == 0
        a1 = -tau*tau_ts;
        b0 = ts*tau_ts;
        b1 = 0;
    elseif isLPF == 1
        a1 = -tau*tau_ts;
        b0 = tau*tau_ts;
        b1 = -tau*tau_ts;
    end
end