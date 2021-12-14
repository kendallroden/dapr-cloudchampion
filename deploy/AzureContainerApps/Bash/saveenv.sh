#!/bin/bash

# Emit a file that captures all of the environment variables that are needed to persist past
# the page they are created on. Then a user can source this file to restore those environment 
# variables if their shell session is reset for some reason.

cat > capps.env << EOF
#!/bin/bash
$(env | sed -n "s/\(.*_CAPPS=\)\(.*\)/export \1'\2'/p" | sort)
EOF

cat capps.env