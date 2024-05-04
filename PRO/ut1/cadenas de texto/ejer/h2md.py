# ****************************
# CONVIRTIENDO HTML A MARKDOWN
# ****************************


def run(html: str) -> str:
    clean_text = html[4:-5]
    hastag = '#' * int(html[2])
    markdown = f'{hastag} {clean_text}'
    return markdown


if __name__ == '__main__':
    run('<h1>Core</h1>')