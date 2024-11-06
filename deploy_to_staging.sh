#!/bin/bash

echo "Deploying to Staging..."

# (Add the actual deployment commands here)
git checkout staging
git pull origin staging
npm install
npm run build
scp -r ./build/* user@staging-server:/var/www/my-app/
ssh user@staging-server 'sudo systemctl restart nginx'

echo "Deployment to Staging completed!"

