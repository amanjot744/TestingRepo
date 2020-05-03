function CheckError ($event, $status)
{
  if ($status)
  {
	write-host "Status on $event | SUCCESS"
  }
  else{
	write-host "Status on $event | FAILURE"
	exit 1
  }
}
$containerid = docker ps -aq -f name=mypythonapp

if ($containerid) 
{
 write-host "Container exists | deleting" 
 docker rm -f $containerid
 CheckError "Deleting Container" $?
}