function [R_s,R_p,T_s,T_p] = fresnel_coeffs(theta_i,eps1,eps2)%,pol)
%Fresenl Reflection & Transmission coefficients for light polarized perpendicular (R_s, T_s) 
%      & parallel (R_p, T_p) to the plane of incidence, striking the surface at
%      the angle theta_i. Going from material with dielectric constant of eps1 to material with a
%      dielectric constant of eps2.
%       pol = polarization ratio R_s / R_p

% Total reflection coefficient returned in dB

root_s            = sqrt(eps2 - eps1 * sind(theta_i).^2);

root_p           = sqrt(eps1 - sind(theta_i).^2.*(eps1.^2/eps2));

R_s             = 10 * log10(abs( (eps1 * cosd(theta_i) - root_s ) ./ (eps1 * cosd(theta_i) + root_s) ).^2);

R_p             = 10 * log10(abs( (root_p - sqrt(eps2) * cosd(theta_i)) ...
                        ./ (root_p + sqrt(eps2) * cosd(theta_i)) ).^2);

%R               = 10 * log10( (pol .* R_s) + ((1-pol) .* R_p) );

T_s             = 1 - R_s;
T_p             = 1 - R_p;

end

