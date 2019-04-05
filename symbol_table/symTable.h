#ifndef symTable_h
#define symTable_h
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TABLE_SIZE 20

int hashIndex=0;

typedef struct {
	int index;
	char name[10];
	int scope;
	char datatype[10];
	int isFunction;
	char returnType[10];
	int argCount;
	int* argsID;
}TOKEN;

TOKEN* SYMTABLE[TABLE_SIZE];

TOKEN* newToken() {
	TOKEN* temp = (TOKEN*)malloc(sizeof(TOKEN));
	return temp;
}
TOKEN* initialiseArgs(TOKEN* f, int argCount) {
	f->argCount = argCount;
	f->argsID = (int*)calloc(argCount,sizeof(int));
	int i;
	for(i=0; i<argCount; i++) {
		f->argsID[i]=-1;
	}
}


int hashFunction() {
	return hashIndex++;
}

void initialiseTable() {
	int i;
	for(i=0; i<TABLE_SIZE; i++) {
		SYMTABLE[i] = NULL;
	}
}

void printToken(TOKEN* t) {
	printf("%-12d%-12s%-12s",t->index,t->name,t->datatype);
	t->scope==1?printf("\tL\n"): printf("\tG\n");
}

void printSymbolTable() {
	int i;
	printf("--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--x--\n");
	printf("\t\t\tSYMBOL TABLE\n\n");
	printf("index\tlexemeName\tDatatype\tscope\n\n");
	for(i=0; i<TABLE_SIZE; i++) {
		if(SYMTABLE[i]==NULL)
			continue;
		printToken(SYMTABLE[i]);
	}
}

int searchTable(char* item) {
	int i; 
	for(i=0; i<TABLE_SIZE; i++) {
		if(SYMTABLE[i]!=NULL && strcmp(SYMTABLE[i]->name,item)==0) return i;
	}
	return -1;
}
#endif