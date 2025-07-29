const cache_name="CIE";
const urls_to_cache=[
  "/",
  "mad_cie.html",
  "manifest.json",
  "stocks.json"
];

self.addEventListener("install",event =>{
  event.waitUntil(
    caches.open(cache_name).then(cache =>{
      cache.addAll(urls_to_cache).then(console.log("All files cached successfully!"))
    }
    
    
    )
  )
});

self.addEventListener("activate",event =>{
  event.waitUntil(self.clients.claim());
});

self.addEventListener("fetch",event =>{
  event.respondWith(
    caches.match(event.request).then(response =>{
      return response || fetch(event.request)
    })
  )
    });
  

