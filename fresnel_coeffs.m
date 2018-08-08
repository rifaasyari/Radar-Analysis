function [R,T] = fresnel_coeffs(theta_i,eps1,eps2)%,pol)
%Fresenl Reflection & Transmission coefficients for light polarized perpendicular (R_s, T_s) 
%      & parallel (R_p, T_p) to the plane of incidence, striking the surface at
%      the angle theta_i (in degrees). Going from material with dielectric constant of eps1 to material with a
%      dielectric constant of eps2.
%       pol = polarization ratio R_s / R_p
%      Output is vectors R & T, first element being perpendicular
%      polarization & second element being parallel polarization.

% Total reflection coefficient returned in dB

root_r           = sqrt(1 - (eps1/eps2) * sind(theta_i).^2);

R_s             = abs( (sqrt(eps1) * cosd(theta_i) - sqrt(eps2) * root_r ) ...
                    ./ (sqrt(eps1) * cosd(theta_i) + sqrt(eps2) * root_r) ).^2;

R_p             = abs( (sqrt(eps1) * root_r - sqrt(eps2) * cosd(theta_i)) ...
                        ./ (sqrt(eps1) * root_r + sqrt(eps2) * cosd(theta_i)) ).^2;

%R               = 10 * log10( (pol .* R_s) + ((1-pol) .* R_p) );

T_s             = 1 - R_s;
T_p             = 1 - R_p;

%dB space:
R_s             = 10 * log10(R_s);
R_p             = 10 * log10(R_p);
T_s             = 10 * log10(T_s);
T_p             = 10 * log10(T_p);

R               = [R_s;R_p];
T               = [T_s;T_p];

end

