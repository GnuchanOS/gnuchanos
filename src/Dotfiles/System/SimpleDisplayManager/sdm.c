#include <stdio.h>
#include <stdlib.h>
#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <string.h>
#include <unistd.h>

// PAM callback fonksiyonu
static struct pam_conv conv = {
    misc_conv,
    NULL
};

int authenticate_user(const char *username, const char *password) {
    pam_handle_t *pam_handle = NULL;
    int retval;

    // PAM oturumu başlat
    retval = pam_start("login", username, &conv, &pam_handle);
    if (retval != PAM_SUCCESS) {
        fprintf(stderr, "PAM start failed: %s\n", pam_strerror(pam_handle, retval));
        return 0;
    }

    // PAM doğrulama için şifreyi geçici bir yapı olarak ayarla
    struct pam_response *resp = NULL;

    resp = (struct pam_response *)malloc(sizeof(struct pam_response));
    if (!resp) {
        fprintf(stderr, "Memory allocation failed for response struct.\n");
        pam_end(pam_handle, PAM_BUF_ERR);
        return 0;
    }
    resp->resp = strdup(password);
    if (!resp->resp) {
        fprintf(stderr, "Memory allocation failed for password.\n");
        free(resp);
        pam_end(pam_handle, PAM_BUF_ERR);
        return 0;
    }
    resp->resp_retcode = 0;

    const struct pam_conv temp_conv = {misc_conv, &resp};
    pam_set_item(pam_handle, PAM_CONV, &temp_conv);

    // Kimlik doğrulama işlemini yap
    retval = pam_authenticate(pam_handle, 0);
    if (retval != PAM_SUCCESS) {
        fprintf(stderr, "Authentication failed: %s\n", pam_strerror(pam_handle, retval));
        pam_end(pam_handle, retval);
        return 0;
    }

    // Yetkilendirme kontrolü
    retval = pam_acct_mgmt(pam_handle, 0);
    if (retval != PAM_SUCCESS) {
        fprintf(stderr, "Account management failed: %s\n", pam_strerror(pam_handle, retval));
        pam_end(pam_handle, retval);
        return 0;
    }

    // PAM oturumunu kapat
    pam_end(pam_handle, PAM_SUCCESS);
    return 1;
}

int main() {
    char username[32];
    char password[32];

    printf("Simple Display Manager\n");
    printf("Username: ");
    scanf("%31s", username);

    printf("Password: ");
    system("stty -echo"); // Şifre girişini gizle
    scanf("%31s", password);
    system("stty echo");

    if (authenticate_user(username, password)) {
        printf("\nLogin successful! Starting session...\n");
        sleep(1);

        // Kullanıcı oturumunu başlat
        if (setuid(geteuid()) == -1) {
            perror("setuid failed");
            return 1;
        }

        char command[128];
        snprintf(command, sizeof(command), "su - %s -c 'startx'", username);
        system(command);
    } else {
        printf("\nInvalid username or password.\n");
    }

    return 0;
}