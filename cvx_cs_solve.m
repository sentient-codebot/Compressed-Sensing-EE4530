% load cs.mat first

cvx_begin
    variable x_hat(128)
    minimize (norm(x_hat,1))
    subject to
        X_sym(1:64) - F_sym(1:64,:)*x_hat == 0;
        -x_hat <= 0;
cvx_end