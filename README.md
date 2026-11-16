# meme-slide
Small container serving memes from a git submodule.

Exposes nginx on port 80 and serves a minimal JS script/html wrapper that enables auto-rotating the images.

## Configuration

You may override the configuration at `/usr/share/nginx/html/config.json`:

```json
{
  "intervalSeconds": 10
}
```
