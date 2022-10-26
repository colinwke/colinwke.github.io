# coding=utf-8
# @time: 2021/4/4 08:53
# @author: Wang Ke
# @contact: wangke09@58.com
# ================================================================

import os


def get_walk_dirs_files(root):
    """get all files in walk root."""
    walk_dirs = []
    walk_files = []
    for root, dirs, files in os.walk(root):
        for dir_ in dirs: walk_dirs.append(os.path.join(root, dir_))
        for file_ in files: walk_files.append(os.path.join(root, file_))

    return walk_dirs, walk_files


def format_head(path):
    with open(path, "r+") as f:
        p = [x.rstrip() for x in f]

    def fff(x):
        if x.startswith("title: "):
            x = "title: \"" + x.split("title: ")[1] + "\""
        elif x.startswith("categories: "):
            m = x.split("categories: ")[1].replace("[]", "[unsort]").replace("[", "[\"").replace("]", "\"]").replace(",", "\",\"")
            if not m.startswith("["): m = "[\"" + m + "\"]"
            x = "categories: " + m.replace(" ", "")
        elif x.startswith("tags: "):
            m = x.split("tags: ")[1].replace("[]", "[unsort]").replace("[", "[\"").replace("]", "\"]").replace(",", "\",\"")
            if not m.startswith("["): m = "[\"" + m + "\"]"
            x = "tags: " + m.replace(" ", "")
        elif x.startswith("date: "):
            """date: 2021-04-04T00:25:47+08:00"""
            x = "date: \"" + "T".join(x.split("date: ")[1].split()) + "+08:00" + "\""
        elif x.startswith("author: "):
            x = "author: " + "\"" + x.split("author: ")[1] + "\""
        elif x.startswith("email: "):
            x = "email: " + "\"" + x.split("email: ")[1] + "\""
        elif x.startswith("homepage: "):
            x = "homepage: " + "\"" + x.split("homepage: ")[1] + "\""
        elif x.startswith("urlname: ") or x.startswith("mathjax: "):
            return None
        elif x.startswith("---"):
            pass
        else:
            return None
        return x

    if len(p) > 0 and p[0].startswith("---"):
        head_idx = [i for i, x in enumerate(p) if x.startswith("---")]
        head = p[0:head_idx[1] + 1]
        head = [x for x in [fff(x) for x in head] if x is not None]
        content = p[head_idx[1] + 1:]
        all = head + content
    else:
        print("AAAAAAAAAAAAAAAA" + path)

    # path_out = path.replace("posts/old", "posts/old2")
    # print(path_out)
    path_out = path
    os.makedirs(os.path.dirname(path_out), exist_ok=True)
    with open(path_out, "w") as f:
        f.write("\n".join(all))


def main():
    path = "/content/posts/old"
    walk_dirs, walk_files = get_walk_dirs_files(path)

    files_md = [x for x in walk_files if x.endswith(".md")]

    for md in files_md:
        format_head(md)


if __name__ == '__main__':
    main()
