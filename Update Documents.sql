update Documents
   set Filename = Description || '.pdf'
 WHERE Filename IS NULL;

update Documents
   set title = Replace(Filename,'.pdf','')
 where title IS NULL;



