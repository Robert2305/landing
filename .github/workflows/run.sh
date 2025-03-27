#!/bin/bash
# Create the app.service file dynamically
sudo bash -c 'cat > /usr/lib/systemd/system/app.service <<EOF
[Unit]
Description=Angular App Service - serving built Angular application
Documentation=https://example.com
After=network.target

[Service]
Environment=NODE_PORT=3001
Type=simple
User=root
WorkingDirectory=/home/github_agent/actions-runner/_work/landing/landing/
ExecStart=npm run start -- --host 0.0.0.0
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable app.service

# Start the service immediately
sudo systemctl start app.service

# Check the status of the service
sudo systemctl status app.service

echo "Deployment complete."
