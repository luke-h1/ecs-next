## Next.js on ecs

## deployed site

https://lhowsam.site

## deploy site on vercel
https://ecs-next-cxdubo3u1-luke-h1.vercel.app/

### TODO

- add www. > https redirect to ALB
- don't build new docker image if no changes in certain files
- configure TF for CI/CD user
- provision s3 bucket with TF
- place secrets in vault (not needed for the time being since this repo doesnt have any secrets but will be needed for migration)
- configure prometheus and grafana for monitoring and alerting - house this in different repository (rework automation repo)
- configure cloudflare for ddos protection
- look into cloudfront
- ensure migration plan makes sense and is durable from deploy to deploy
