function intersectionAnswer = isIntersect(L1_x1, L1_y1, L1_x2, L1_y2, L2_x1, L2_y1, L2_x2, L2_y2)
% Compute several intermediate quantities
Dx12 = L1_x1-L1_x2;
Dx34 = L2_x1-L2_x2;
Dy12 = L1_y1-L1_y2;
Dy34 = L2_y1-L2_y2;
Dx24 = L1_x2-L2_x2;
Dy24 = L1_y2-L2_y2;
% Solve for t and s parameters
ts = [Dx12 -Dx34; Dy12 -Dy34] \ [-Dx24; -Dy24];
% Take weighted combinations of points on the line
P = ts(1)*[L1_x1; L1_y1] + (1-ts(1))*[L1_x2; L1_y2];
%Q = ts(2)*[L2_x1; L2_y1] + (1-ts(2))*[L2_x2; L2_y2];
if(isfinite(P(1)) && isfinite(ts(1)))
    intersectionAnswer = true;
else
    intersectionAnswer = false;
end
end