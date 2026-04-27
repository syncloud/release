# release

Syncloud app catalog. Holds the `index-v2` manifest and `images/*-128.png` icons that platform clients fetch from `https://apps.syncloud.org/releases/<branch>/`.

## Publish

Requires AWS CLI ([install](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)) and a `syncloud` profile in `~/.aws/credentials`.

```
AWS_PROFILE=syncloud ./publish.sh master
AWS_PROFILE=syncloud ./publish.sh stable --force
```

`master` feeds dev/CI clients; `stable` feeds production and requires `--force`.

## Add an app

1. Add `images/<id>-128.png` (128×128, dark or transparent background).
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
3. Commit, push, then `publish.sh master`.
