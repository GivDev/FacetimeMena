#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <sys/utsname.h>

void Finish(const char *finish) {
    if (finish == NULL)
        return;

    const char *cydia(getenv("CYDIA"));
    if (cydia == NULL)
        return;

    int fd([[[[NSString stringWithUTF8String:cydia] componentsSeparatedByString:@" "] objectAtIndex:0] intValue]);

    FILE *fout(fdopen(fd, "w"));
    fprintf(fout, "finish:%s\n", finish);
    fclose(fout);
}

int main(int argc, char **argv, char **envp) {
	
	struct utsname u;
	int err = uname(&u);
  	if (err == -1) {
    	printf("uname failed - what platform is this?\n");
    	printf("there's no way this will work, but trying anyway!\n");
    	return 0;
  	}

  	bool restoreBackup = true;

  	if (strstr(u.machine, "iPhone")) {
  		printf("\n");
		printf("Restoring iphone carrier bundles backup\n");


		if (system("mv -f '/System/Library/Carrier Bundles/iPhone/STC_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPhone/STC_sa.bundle'") != 0) {
			restoreBackup = false;
		}
		if (system("mv -f '/System/Library/Carrier Bundles/iPhone/mobily_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPhone/mobily_sa.bundle'") != 0) {
			restoreBackup = false;
		}
		if (system("mv -f '/System/Library/Carrier Bundles/iPhone/Zain_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPhone/Zain_sa.bundle'") != 0) {
			restoreBackup = false;
		}
  	}

  	if (strstr(u.machine, "iPad")) {
  		printf("\n");
		printf("Restoring ipad carrier bundles\n");


		if (system("mv -f '/System/Library/Carrier Bundles/iPad/STC_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPad/STC_sa.bundle'") != 0) {
			restoreBackup = false;
		}
		if (system("mv -f '/System/Library/Carrier Bundles/iPad/mobily_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPad/mobily_sa.bundle'") != 0) {
			restoreBackup = false;
		}
		if (system("mv -f '/System/Library/Carrier Bundles/iPad/Zain_sa.bundle.OLD' '/System/Library/Carrier Bundles/iPad/Zain_sa.bundle'") != 0) {
			restoreBackup = false;
		}
  	}

	

	if (restoreBackup) {
		printf("Restore finished successfully \n");
	}
	printf("Rebooting your device\n");
	printf("\n");

    Finish("reboot");
	return 0;
}

// vim:ft=objc
