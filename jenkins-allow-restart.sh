#!/bin/bash
# Allow jenkins user to restart jenkins

COMMAND="jenkins ALL=(root) NOPASSWD: /var/lib/jenkins/restart-jenkins.sh"
JENKINS_HOME=/var/lib/jenkins
RESTART_SCRIPT=restart-jenkins.sh

# Create restart script
echo "#!/bin/bash" > $JENKINS_HOME/$RESTART_SCRIPT
echo "/etc/init.d/jenkins restart" >> $JENKINS_HOME/$RESTART_SCRIPT

# Allow jenkins to execute script as root
if ! grep -q "$COMMAND" /etc/sudoers; then
   echo $COMMAND >> /etc/sudoers
fi

