function kernel_find_file() {
    git grep $1 | cut -d ":" -f 1 | grep $1 | sort | uniq -u
}
