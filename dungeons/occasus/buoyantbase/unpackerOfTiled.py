import json, base64, zlib

js = json.load(open('occasusbuoyantbasementrooms.json'))
layer = next(l for l in js['layers'] if l['name']=='back')
raw = base64.b64decode(layer['data'])
decoded = zlib.decompress(raw)
gids = [int.from_bytes(decoded[i:i+4], 'little') for i in range(0, len(decoded), 4)]
print(gids)
gidsNew = [gid & 536870911 for gid in gids]
print(gidsNew)
