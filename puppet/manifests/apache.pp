node 'default' {
  $adminemail = 'devops@maark.com'
  $servername = ' izo-storybook.maarkdev.com'
 
  include apache
  include apache::vhosts
  }
