#include "tools/floppy.h"
#include "tools/fileinfo.h"

int main() {
    char* boot_filePath = "/home/xijianlv/CLionProjects/os/learnOS/build/boot/boot.o";
    char* setup_filePath = "/home/xijianlv/CLionProjects/os/learnOS/build/boot/setup.o";

    Floppy* floppy = create_floppy();

    Fileinfo* boot_fileInfo = read_file(boot_filePath);
    write_bootloader(floppy, boot_fileInfo);

    Fileinfo* setup_fileInfo = read_file(setup_filePath);
    write_floppy_fileinfo(floppy,setup_fileInfo,0,0,2);

    create_image("/home/xijianlv/CLionProjects/os/learnOS/a.img", floppy);

    return 0;
}
