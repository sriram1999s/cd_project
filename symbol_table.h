typedef struct Symbol_Table
{
  char *name;
  int ix;
}SYMTAB;
int add_to_tab(char *);
void display_tab();
void delete_tab();
#define SYMTABSIZE 10
