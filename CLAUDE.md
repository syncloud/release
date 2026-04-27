# Releasing the app catalog

The catalog (`index-v2` + `images/*.png`) is published to S3 by `publish.sh`. The Syncloud platform clients pull from `https://apps.syncloud.org/releases/<branch>/`.

## Publish

AWS creds for the syncloud account live in `~/.aws/credentials` under the `syncloud` profile.

```
AWS_PROFILE=syncloud ./publish.sh master
```

Branches:
- `master` — dev/CI clients
- `stable` — production clients; requires `--force`:
  `AWS_PROFILE=syncloud ./publish.sh stable --force`

The script uploads `index-v2`, then md5s every `images/*.png` and `aws s3 sync`s the `images/` directory. md5 files are what clients use to detect icon changes.

## Adding a new app

1. Drop a 128×128 PNG into `images/<id>-128.png`. Style: square, dark or transparent background, app brand mark centered.
2. Append an entry to `index-v2`:
   ```json
   {
     "name" : "Display Name",
     "id" : "<snap id>",
     "required" : false,
     "ui": true,
     "icon": "<id>-128.png",
     "description": "One-line summary"
   }
   ```
3. Commit, push, then run `publish.sh master`.
