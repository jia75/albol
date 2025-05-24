OBJ = obj/add-branch.o obj/edit-branch.o obj/more-branch.o \
obj/trac-branch.o obj/view-branch.o
BINDIR = bin/
OBJDIR = obj/

COBC = cobc
COBFLAGS = -free

all: bin/out

bin/out: $(OBJ) | $(BINDIR) $(OBJDIR)
	$(COBC) $(COBFLAGS) -x -o $@ src/main.cbl $(OBJ)

obj/add-branch.o: src/add-branch.cbl | $(OBJDIR)
	$(COBC) $(COBFLAGS) -c -o $@ src/add-branch.cbl

obj/edit-branch.o: src/edit-branch.cbl | $(OBJDIR)
	$(COBC) $(COBFLAGS) -c -o $@ src/edit-branch.cbl

obj/more-branch.o: src/more-branch.cbl | $(OBJDIR)
	$(COBC) $(COBFLAGS) -c -o $@ src/more-branch.cbl

obj/trac-branch.o: src/trac-branch.cbl | $(OBJDIR)
	$(COBC) $(COBFLAGS) -c -o $@ src/trac-branch.cbl

obj/view-branch.o: src/view-branch.cbl | $(OBJDIR)
	$(COBC) $(COBFLAGS) -c -o $@ src/view-branch.cbl

$(BINDIR) $(OBJDIR):
	mkdir -p $@