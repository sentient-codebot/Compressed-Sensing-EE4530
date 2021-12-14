% sym over k=65 only works for even length signals
% X_us_shifted = fftshift(X_us);
X_sym = X_us;
F_full = dftmtx(length(X_us))/sqrt(length(X_us));
for i=2:length(X_us)/2
    if abs(X_sym(i)) <= 0.01* abs(X_sym(length(X_us)+2-i)) % close to zero
        X_sym(i) = X_sym(length(X_us)+2-i)';
    elseif abs(X_sym(i)) * 0.01 <= abs(X_sym(length(X_us)+2-i)) % two terms close
        X_sym(i) = (X_sym(length(X_us)+2-i)' + X_sym(i))/2;
    end
end
X_sym(length(X_us)/2+2:end) = conj(X_sym(length(X_us)/2:-1:2));

F_sym = F_us;
nonzero_idx = find(X_sym);
F_sym(nonzero_idx,:) = F_full(nonzero_idx,:);


plot(abs(X_sym),'--')
hold on 
plot(abs(X_us))