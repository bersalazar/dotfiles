config.load_autoconfig(True)

c.editor.command = ['/usr/local/bin/gvim', '{file}']
c.content.default_encoding = 'utf-8'
c.content.pdfjs = True
c.fonts.default_size = '11pt'
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.goodreads.com/search?q={}',
    'w': 'https://en.wikipedia.org/wiki/{}',
    'y': 'https://www.youtube.com/results?search_query={}',
    }

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
