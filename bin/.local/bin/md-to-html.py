# Copied from https://stackoverflow.com/a/41005658
#
# This is a filter that converts all .md links to .html links in a markdown file
import panflute

def action(elem, doc):
    if isinstance(elem, pf.Link) and elem.url.endswith('.md'):
        elem.url = elem.url[:-3] + '.html'
        return elem

if __name__ == '__main__':
    pf.run_filter(action)
