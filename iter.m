function E=iter(M,e,error)
loopCounter = 0;
maxSteps=100000;
S=M;
E0=M;
E0s=M-2*error;%-10^(-10);
while (abs(E0 - E0s) >= error)
    E = M+e*sin(E0);
    E0s=E0;
    E0=E;
    loopCounter = loopCounter + 1;
    if loopCounter > maxSteps
        print('error');
        % include warning message
        break
    end
end   