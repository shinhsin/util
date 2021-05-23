#
# First, list the files to parse. Build a file list.
#

if [[ -n "$1" && -n "$2"  && -n "$3" ]];then
  SRC_DIR=$1 
  DB_DIR=$2
  DB=$3
else
  echo "Usage: $0 SRC_DIR DB_DIR DBNAME"
#  exit 1
fi

if [[ ! -d "$DB_DIR" ]];then

echo "$DB_DIR doesn't exist,"
echo "should I create it for you?[y] or exit[n]?"
read nas

if [ "$nas" != "Y" ] && [ "$nas" != "y" ];then
return 0;
fi

echo "Create new db folder $DB_DIR"
mkdir "$DB_DIR" 
fi

### Block comment

if true 
then
#######

echo "This will generate list file: $DB_DIR/$DB.files"
echo "Build files list."
echo "SRC_DIR: $SRC_DIR, DB: $DB_DIR/$DB.files"
echo "Building...."

EXCLUD_PATH="! -path \"*/out*\" ! -path \"*/.git/*\" ! -path \"*/.svn/*\" ! -path \"*/l2agent*\" ! -path \"*/images*\" ! -path \"*/package_src/*\"  -not -type l"
FILE_EXT="c|cc|h|cli|icli|pl|sh|cxx|hxx|dat|tbl"
REG=".*\.("$FILE_EXT")\$"

if [[ -d "$SRC_DIR" ]];then
rm $DB_DIR/$DB.files 2>1 /dev/null
#ok
#time find $SRC_DIR ! -path "*/out*" ! -path "*/.git/*" ! -path "*/.svn/*" ! -path "*/l2agent*" ! -path "*/images*" ! -path "*/package_src/*"  -not -type l -regextype posix-extended  -regex '.*\.(c|cc|h|cli|icli|pl|sh|cxx|hxx|dat|tbl)$'  > $DB_DIR/$DB.files
echo "time find $SRC_DIR ! -path "*/out*" ! -path "*/.git/*" ! -path "*/.svn/*" ! -path "*/l2agent*" ! -path "*/images*" ! -path "*/package_src/*"  -not -type l -regextype posix-extended  -regex $REG  > $DB_DIR/$DB.files"
time find $SRC_DIR ! -path "*/out*" ! -path "*/.git/*" ! -path "*/.svn/*" ! -path "*/l2agent*" ! -path "*/images*" ! -path "*/package_src/*"  -not -type l -regextype posix-extended  -regex $REG  > $DB_DIR/$DB.files


#cat $DB_DIR/$DB.files
else
  echo "Dir doesn't exist."
fi

echo "Build files list done. Next, build cscope db."


#
# Second, parse files to build cscope db
#

  FILELIST="$DB.files"
  CSCOPENAME="$DB"

if [[ -n "$DB_DIR" && -n "$FILELIST" && -n "$CSCOPENAME" ]];then
  echo "Build cscope db. "
  echo "This will generate cscope file: $DB_DIR/$CSCOPENAME.cscope"
  echo "Building...."
else
  echo "Usage: $0 DB_DIR FILE_LIST_NAME DESIRED_CSCOPE_NAME"
  return 1
fi

if [ -d $DB_DIR ];then
#  echo "cscope -bqk -i $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope"
  echo "cscope -bk -i *.h *.c $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope"
 
  time cscope -bk -i $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope
else
  echo "Invalid directory: $DB_DIR"
fi

#
# Build cscope db done. Next, build ctag db.
#

  CTAGSNAME="$DB"

if [[ -n "$DB_DIR" && -n "$FILELIST" && -n "$CTAGSNAME" ]];then
  echo "Build cscope db done. Next, build ctag db."
  echo "This will generate tag file: $DB_DIR/$CTAGSNAME.taglist"
else
  echo "Usage: $0 DB_DIR FILE_LIST_NAME CTAGSNAMES"
  return 1
fi

  echo "ctags -L $DB_DIR/$FILELIST -f $DB_DIR/$CTAGSNAME.taglist"

#  time ctags -L $DB_DIR/$FILELIST -f $DB_DIR/$CTAGSNAME.taglist 
  time ctags -L $DB_DIR/$FILELIST -f $DB_DIR/$CTAGSNAME.taglist --C-kinds=+p --fields=+iaS --extra=+q  --exclude=.svn  --c++-kinds=+p --fields=+iaS 

  echo "Build ctag list done."

############ end of block comment
fi
#########

  echo "Set vim cscope/tags db now."

  source ~/cscope/cscope_setDB $DB_DIR $DB
