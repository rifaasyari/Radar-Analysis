function [sigma_0] = radar_backscatter_fractal_surface(rho,s_l,H,theta)
%This function solves numerically for the radar backscatter cross-section
%for a self-affine dielectric surface following the methods of Shepard and
%Campbell, 1999
%INPUT VARIABLES
% rho = R^2, Fresnel power reflection coefficient
% s_l = rms slope of the surface at the scale of the illuminating wavelength
%       lambda
% H = Hurst exponent of the self-affine surface.
% theta = incidence angle
%OUTPUT VARIABLE:
% sigma_0 = radar backscatter cross-section in dB

integrand               = @(x) exp(-4 * pi.^2 .* s_l.^2 .* x.^(2*H) .* cosd(theta).^2) ...
                            .* x .* besselj(0, 4 * pi * x .* sind(theta) );

int_eval                = integral(integrand,0,Inf);                        

sigma_0                 = 16 * pi^3 * rho * int_eval.^2;

%change to dB scale:
sigma_0                 = 10 * log10(sigma_0);

end

