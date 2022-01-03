config.load_autoconfig(True)

c.editor.command = ['/usr/local/bin/gvim', '{file}']
c.content.default_encoding = 'utf-8'
c.content.pdfjs = True
c.content.blocking.method = 'both'
c.content.cookies.accept = 'all'
c.fonts.default_size = '11pt'
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'y': 'https://www.youtube.com/results?search_query={}',
    'w': 'https://en.wikipedia.org/wiki/{}',
    'go': 'https://www.goodreads.com/search?q={}',
    'az': 'https://www.amazon.es/s?k={}',
    }

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind(',p', 'spawn --userscript pocket.sh')
config.bind(',m', 'spawn mpv {url}')
