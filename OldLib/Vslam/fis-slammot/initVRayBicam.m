function [vRay,Obs] = initVRayBicam(...
   Rob,Cam,Obs,...
   sMin,alpha,...
   patchSize,ns)


vRay  = vRayInit(...
   Cam,...
   Obs(1),...
   sMin,1e4,...
   alpha,...
   patchSize);

vRay.Prj(2).region = ray2par(...
   vRay,...
   2,...
   ns,...
   patchSize);

[ Obs(2).y,...
   vRay.Prj(2).sc,...
   vRay.Prj(2).cPatch] ...
   ...
   = patchScan(...
   ...
   2,...
   vRay.wPatch,...
   vRay.Prj(2).region,...
   vRay.Prj(2).region.x0,...
   .98,...
   .89);

vRay.Prj(2).y = Obs(2).y;