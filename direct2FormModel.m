function result = direct2FormModel(data, a1, a2, b0, b1, b2)
    result = zeros(size(data));
    timeZone = zeros(size(data));
    
    for i = 3 : size(data, 2)
        sum0 = -a1*timeZone(i-1) - a2*timeZone(i-2);
        timeZone(i) = data(i) + sum0;
        result(i) = b0*timeZone(i) + b1*timeZone(i-1) + b2*timeZone(i-2);
    end
end