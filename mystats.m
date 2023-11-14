function [my_mean,my_std,my_skewness,my_kurtosis] = mystats(x)
my_mean = mean(x);
my_std = std(x);
my_skewness = skewness(x);
my_kurtosis = kurtosis(x);
