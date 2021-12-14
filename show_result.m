% load cs.mat and solve the problem first

plot(x)
hold on
plot(x_hat,'.')
MSE_error = mean((x-x_hat).^2)