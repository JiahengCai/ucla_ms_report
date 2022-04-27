# this is the start of the code for the MS report

## calling useful packages

using Random, Distributions, PlotlyJS, Gadfly

# the first part is some toys for the standard pso algorithm

## here is an example for using standard pso for optimize lilekihood for normal distributions

Random.seed!(1)
d = Normal(20,13)
xnorm = rand(d, 10000)
para = [20, 13]
function normallikelihood(data, para)
    likelihood = -(size(data,1)/2)*log(2*pi) - 
    (size(data,1)/2)*log(para[2]^2) - (1/(2*para[2]^2))*sum((data .- para[1]).^2)
    return likelihood
end

normallikelihood(xnorm,para)

## draw a contour plot

x = y = [i for i in 1:25]
z = [-(size(xnorm,1)/2)*log(2*pi) - 
(size(xnorm,1)/2)*log(y[j]^2) - 
(1/(2*y[j]^2))*sum((xnorm .- x[i]).^2) 
for i in 1:25 for j in 1:25]
z_ = [z[i:i+24] for i in 1:25:625]

data = contour(x = x,
y = y, 
;z=z_,
contours_start=-40000,
contours_end=-50000,
contours_size=-20)

plot(data)

plot(contour(
    z=[
        10      10.625      12.5       15.625     20
        5.625    6.25       8.125      11.25      15.625
        2.5      3.125      5.         8.125      12.5
        0.625    1.25       3.125      6.25       10.625
        0        0.625      2.5        5.625      10
    ]'
))