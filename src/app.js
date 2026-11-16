const DEFAULT_INTERVAL_SECONDS = 10;

async function json(url, fallback) {
  try {
    const res = await fetch(url, { cache: "no-store" });
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (e) {
    console.warn("could not load", url, e);
    return fallback;
  }
}

async function main() {
  const [config, memes] = await Promise.all([
    json("config.json", {}),
    json("memes.json", []),
  ]);

  if (!memes.length) {
    console.error("no memes found");
    return;
  }

  const seconds = Number(config.intervalSeconds) > 0
    ? Number(config.intervalSeconds)
    : DEFAULT_INTERVAL_SECONDS;

  const img = document.getElementById("meme");
  const show = () => {
    img.src = "memes/" + memes[Math.floor(Math.random() * memes.length)];
  };

  show();
  setInterval(show, seconds * 1000);
}

main();
