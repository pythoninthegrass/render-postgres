# Postgres on Render

## Deploy

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/pythoninthegrass/render-postgres)

## Caveats

- This deploy makes the PostgreSQL database accessible to the public internet. This can be changed by updating the `ipAllowList` in the repo's `render.yaml` or by making [similar changes](https://render.com/docs/databases#access-control) in the Render Dashboard. Deleting all access control rules will make the 
