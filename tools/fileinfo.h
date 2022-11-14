//
// Created by xijianlv on 2022/11/14.
//

#ifndef LEARNOS_FILEINFO_H
#define LEARNOS_FILEINFO_H

typedef struct {
    char*   name;
    int     size;
    char*   content;
}Fileinfo;

Fileinfo* read_file(const char* filename);

#endif //LEARNOS_FILEINFO_H
