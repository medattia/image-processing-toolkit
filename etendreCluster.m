function tags = etendreCluster(tags, X, Y, i, neighboursI, cluster, eps, nbMinPts)
   tags(i) = cluster;
   for j=neighboursI
      if tags(j) == 0
         neighboursJ = epsilonVoisinage(X, Y, j, eps);
         if length(neighboursJ) >= nbMinPts
            for k = neighboursJ
                tags(k) = cluster;
            endfor
         endif
      endif
   endfor
endfunction