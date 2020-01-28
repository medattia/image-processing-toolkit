function tags = DBSCAN(X, Y, eps, nbMinPts)
   n = length(X);
   assert(n == length(Y));
   cluster = 0;
   tags = zeros(n);
   for i = 1 : n
      if tags(i) == 0
          neighboursI = epsilonVoisinage(X, Y, i, eps);
          if length(neighboursI) < nbMinPts
             tags(i) = -1;
          else
             cluster = cluster + 1;
             tags = etendreCluster(tags, X, Y, i, neighboursI, cluster, eps, nbMinPts);
          endif
      endif
   endfor
endfunction