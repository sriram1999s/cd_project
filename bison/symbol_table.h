typedef struct Symbol_Table
{
  char *name;
  int line_no;
  int ix;
  char *type;
  int width;
  union{
    int i;
    float y;
    char c;
    char *s;
   }attribute;
}SYMTAB;
int add_to_tab(char *, int );
void display_tab();
void delete_tab();
#define SYMTABSIZE 10
