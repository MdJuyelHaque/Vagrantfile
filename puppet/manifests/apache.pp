node 'default' {
  $adminemail = 'adminemail'
  $servername = 'serverdns'
 
  include apache
  include apache::vhosts
  }
