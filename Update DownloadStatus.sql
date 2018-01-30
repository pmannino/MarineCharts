Update ENCcharts
   set DownloadStatus = 'Current';
Update RNCcharts
   set DownloadStatus = 'Current';
Update USACECharts
   set DownloadStatus = 'Current';

Update ENCcharts
   set DownloadStatus = 'New'
 where isdt > '2017-12-01';
Update RNCcharts
   set DownloadStatus = 'New'
 where ntm_date > '2017-12-01';
Update USACECharts
   set DownloadStatus = 'New'
 where ENCdate_posted > '2017-12-01';
