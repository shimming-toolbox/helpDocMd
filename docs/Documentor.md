# Documentor

**Filetype:** _MATLAB&reg; classdef_

**Synopsis:** __.m_bedded `doc`s to .md text files_

Documentor (re)publishes embedded source code documentation to text files
(i.e. as [Markdown](https://daringfireball.net/projects/markdown/)).

**Refer to the README document for basic usage.**

__CONSTRUCTOR SYNTAX__

      Dr = Documentor( src ) ;      
      Dr = Documentor( src, Options ) ; 

`src` is a string vector of file paths to .m source files and/or directories
in which to search for them.

The constructor calls the methods `draftcontent` and `autoassigndocfiles`,
which respectively set the properties:
-`docContent`: the documentation text content, and
-`docFile`: the output filepath for the published documentation.

Both of which can be reconfigured prior to publishing to file via `printdoc()`.

__OPTIONS__

The constructor accepts a struct of `Options` parameters, with the following
supported fields.

-`Options.detailLevel`: Specifies the degree of detail to include when
generating documentation via `draftcontent()`.

-`Options.outputDir`: specifies the *primary* folder for the printed
documentation files, used in the call to `autoassigndocfiles()`.

For more info, refer to the documentation for the corresponding methods.

__TIPS__
1. Verify that the assignments to `docFile` are indeed suitable prior
to calling `printdoc`.

2. If `src` will contain paths from all over the file system, it may be
better to construct independent Documentor arrays as the default assignments
to `docFile` are more likely to work if the original `src` paths stem from a
common user directory.

3. To get a better idea of what files will actually be documented, you may
want to first initialize `src` as `src = Documentor.findfiles( src )`, as
is done during object construction. The reason being that `src` is used to
assign the `mFile` property (which is fixed upon object construction) and any
invalid or *incompatible* paths suggested by `src` will be automatically
filtered out. For more info, refer to the documentation entries for
`Documentor.findfiles` and `Documentor.mustBeDocumentable`.

__ETC__
-[test](https://daringfireball.net/projects/markdown/dingus) how a
sample of Markdown text will display once reformatted to HTML

    Documentation for Documentor
       doc Documentor

<details>
<summary><b>Details</b></summary>
 

| Attribute            | Value |
|:--------------------:|:-----:|
| Hidden               | false |
| Sealed               | false |
| Abstract             | false |
| Enumeration          | false |
| ConstructOnLoad      | false |
| HandleCompatible     | true  |
| RestrictsSubclassing | false |

- InferiorClasses : [N/A] 
- ContainingPackage : [N/A] 
- EventList : [N/A] 
- EnumerationMemberList : [N/A] 
- Superclasses: handle
 
</details>

- - -
## Properties

 
-----
 
### Ext

**Synopsis:** _Default file extensions_

  Default file extensions

<details>
<summary><b>Details</b></summary>
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | true  |
| Abstract      | false |
| Transient     | false |
| Hidden        | true  |
| GetObservable | false |
| SetObservable | false |
| AbortSet      | false |
| NonCopyable   | true  |
| HasDefault    | true  |

- GetAccess : public
- SetAccess : none
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- DefaultValue : [N/A] 
- Validation : [N/A] 
- DefiningClass : Documentor
 
</details>
 
-----
 
### mTypesSupported

**Synopsis:** _Supported .m file types (script, function, classdef)_

  Supported .m file types (script, function, classdef)

<details>
<summary><b>Details</b></summary>
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | true  |
| Abstract      | false |
| Transient     | false |
| Hidden        | true  |
| GetObservable | false |
| SetObservable | false |
| AbortSet      | false |
| NonCopyable   | true  |
| HasDefault    | true  |

- GetAccess : public
- SetAccess : none
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- DefaultValue : script; function; classdef
- Validation : [N/A] 
- DefiningClass : Documentor
 
</details>
 
-----
 
### mFile

**Synopsis:** _String vector specifying the full file path of the .m file to document_

For details re: file 'documentability',
See also
Documentor.mustBeDocumentable
Documentor.findfiles

<details>
<summary><b>Details</b></summary>
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | false |
| Abstract      | false |
| Transient     | false |
| Hidden        | false |
| GetObservable | false |
| SetObservable | false |
| AbortSet      | false |
| NonCopyable   | false |
| HasDefault    | true  |

- GetAccess : public
- SetAccess : immutable
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- DefaultValue : /Users/ryan/Projects/General/scripts/helpDocMd/src/@Documentor/Documentor.m
- Validation: 
Validator functions: Documentor.mustBeDocumentable
- DefiningClass : Documentor
 
</details>
 
-----
 
### docFile

**Synopsis:** _String vector specifying the full file path for the printed documentation_

  String vector specifying the full file path for the printed documentation

<details>
<summary><b>Details</b></summary>
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | false |
| Abstract      | false |
| Transient     | false |
| Hidden        | false |
| GetObservable | false |
| SetObservable | false |
| AbortSet      | true  |
| NonCopyable   | false |
| HasDefault    | true  |

- GetAccess : public
- SetAccess : public
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- DefaultValue : 
- Validation: 
Class: string
Validator functions: mustBeStringScalarOrCharVector
- DefiningClass : Documentor
 
</details>
 
-----
 
### docContent

**Synopsis:** _Documentation text content as a string vector_

  Documentation text content as a string vector 

<details>
<summary><b>Details</b></summary>
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | false |
| Abstract      | false |
| Transient     | false |
| Hidden        | false |
| GetObservable | false |
| SetObservable | false |
| AbortSet      | true  |
| NonCopyable   | false |
| HasDefault    | true  |

- GetAccess : public
- SetAccess : public
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- DefaultValue : 
- Validation: 
Class: string
Validator functions: 
- DefiningClass : Documentor
 
</details>

---
## Methods


---


### Documentor

**Synopsis**: _Constructor_ 

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : src, Params
- OutputNames : Dr
- DefiningClass : Documentor
 
</details>

---


### printdoc

**Synopsis**: _Write documentation to file_ 

     
     [docFile, errMsg] = Dr.printdoc( ) 
     [docFile, errMsg] = Dr.printdoc( "isOverwriting", true ) 

Publishes the strings assigned to `Dr.docContent` to the filepaths assigned
to `Dr.docFile`.

To overwrite existing files, use the above name-value argument pair.

Output file paths and error messages are returned as string vectors to output
arguments 1 and 2. Entries of `errMsg` are blank "" if printing succeeded without error.

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : varargin
- OutputNames : docFiles, errMsg
- DefiningClass : Documentor
 
</details>

---


### draftdoc

**Synopsis**: _Documentor/draftdoc is an undocumented builtin Documentor method._ 

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : Dr
- OutputNames : [N/A] 
- DefiningClass : Documentor
 
</details>

---


### autoassigndocfiles

**Synopsis**: _Autogenerates and assigns filenames for the output documentation_ 

      
      [] = Dr.autoassigndocfiles( )
      [] = Dr.autoassigndocfiles( outputDir )

Sets the `docFile` property.

If `Dr` is a Documentor object array, `autoassigndocfiles` attempts to
recreate within `outputDir` the original subdirectory structure among the
source files of `Dr.mFile`.

If `Dr` is a single object, subdirectories aren't considered: documentation
will be printed directly into `outputDir`.

If `outputDir` is not provided as an argument, by default (and when
possible), documentation files will be printed to a folder called "docs", one
level above the base directory common to the paths among `Dr.mFiles`
(presuming this base dir is a source code-specific folder, though it needn't
be). Failing that, "docs" will be in the temporary directory returned by
MATLAB function `tempdir()`.

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : Dr, outputDir
- OutputNames : [N/A] 
- DefiningClass : Documentor
 
</details>

---


### markuptodown

**Synopsis**: _Replace MATLAB Markup elements with corresponding Mkdocs-style Markdown_ 

Reformat links and link-text to Markdown syntax:
i.e. MATLAB markup uses: <https://www.thisSite.com text to display>
whereas Markdown uses: [text to display](https://www.thisSite.com)

[ mdDocStr ] = MARKUPTODOWN( muDocStr )

TODO

+ currrent implementation is simplistic: Basically works for weblinks, but needs
to be elaborated for local links to custom functions & classes: either tags
or relative paths could be used for Mkdocs build.

+ it doesn't distinguish between links and embedded HTML, so it
messes up the latter (see: Documentor.tableattributes)

+ replace instances of 'MATLAB' and/or 'MATLAB(R)' with 'MATLAB&reg;'

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : muDocStr
- OutputNames : mdDocStr
- DefiningClass : Documentor
 
</details>

---


### tableattributes

**Synopsis**: _Return markdown text table of class/classmember attributes_ 

      
      txtTable = tableattributes( Attributes )

`Attributes` is a struct of class member attributes and `txtTable` is
returned as string vector where each element is a row in a dual-column table.

For instance, if `Attributes` possesses the 2 fields
```
Attributes.This = "One";
Attributes.That = "Two";
```
The output table will look like

| Attribute | Value |
|:---------:|:-----:|
|   This    |  One  |
|   That    |  Two  |

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : tableStr
- DefiningClass : Documentor
 
</details>

---


### documentfunction

**Synopsis**: _adds function-specific info to documentation_ 

NOTE: for now, this is just nArgin/nArgout but this should be elaborated
in Examiner.m -- e.g. by parsing the function arguments block when it exists

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : docStr
- DefiningClass : Documentor
 
</details>

---


### documentclassproperties

**Synopsis**: _Return string vector of class property documentation_ 

 DOCUMENTCLASSPROPERTIES Return string vector of class property documentation

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : docStr
- DefiningClass : Documentor
 
</details>

---


### documentclassmethods

**Synopsis**: _Return string vector of class method documentation_ 

 DOCUMENTCLASSMETHODS Return string vector of class method documentation

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : docStr
- DefiningClass : Documentor
 
</details>

---


### documentclassdef

**Synopsis**: _Return string vector of class documentation_ 

Documents basic class attributes followed by class member documentation
(courtesy of calls to `documentclassproperties` and `documentclassmethods`).

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : docStr
- DefiningClass : Documentor
 
</details>

---


### documentbasic

**Synopsis**: _Return string vector of rudimentary documentation_ 

     
     [docStr] = documentbasic( Info )
     [docStr] = documentbasic( Info, headingLevel )

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : docStr
- DefiningClass : Documentor
 
</details>

---


### mustBeDocumentable

**Synopsis**: _Issues an error if input path is not a valid script, function, or classdef .m file._ 

          
      [] = mustBeDocumentable( mFile ) 

Throws an error if `mFile` does not meet the following requirements:

- `mFile` is (or, is convertible to) a string scalar
- `mFile` is a valid file path, i.e. `isfile( mFile )` evaluates to `true`
- `mFile` points to a valid script, function, or classdef file, i.e.
`ismember( Examiner.mfiletype( mFile ), ["script", "function","classdef"] ) == 1`

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : varargin
- OutputNames : [N/A] 
- DefiningClass : Documentor
 
</details>

---


### findfiles

**Synopsis**: _Return list of .m files to document from directory search_ 

     
     mFiles = Documentor.findfiles( src )
     mFiles = Documentor.findfiles( src, isRecursive )

Returns a list of *documentable* .m files `mFiles` based on the set of file
system paths specified in `src`.

`src`
:    a [string-, char-, or cellstr-] array of paths to .m source files,
       and/or directories in which to search for them.

`isRecursive`
:    a Boolean toggle to include subdirectories in the search. To restrict
       the search directories explicitly included in `src`, the function
       should be called with `0` as the second argument.
       [default=`true`]

`mFiles`
:     String-vector list of *Documentor-compatible* .m files

When source files are included in the input, the function verifies that the
Documentor class will indeed be able to document them (see Note 2. below).

When `src` elements point to directories, the function first searches the
directories for .m files, followed by the compatibility check (see Note 3.
below).

__NOTES__

**1. Warnings and errors:**

If identified, invalid paths or incompatible .m files suggested by the given
inputs will elicit warning messages and, if no documentable .m files are
found whatsoever, an error is issued.

**2. Re:'Documentability':**

*Documentability* of a given .m file (i.e. whether it is included among the
returned `mFiles` list) is defined according to the file-type returned by
`mType = Examiner.mfiletype( mFile )`:

-`if mType == "NA"`:
The file is considered invalid and thereby omitted from `mFiles`.
This will be the case for nominal .m files (non-MATLAB files with
'.m' file extensions) as well as invalid MATLAB files (source files with
buggy implementations that preclude assessment with `Examiner.mfiletype`).
For more info, refer to the documentation for Examiner.mfiletype

-`if mType == "method"`:
Standalone source files pertaining to class-methods are, likewise, omitted
from `mFiles` as methods are included as part of the overall class
documentation, rather than documented separately.

**3. .m file search:**

When a directory figures among the entries of the input `src` paths,
`Documentor.findfiles` searches for any .m files contained therein by
wrapping to the standalone function *findfiles.m*, effectively calling:
      
     [~,mFiles] = findfiles( src( isfolder(src) ), "*.m", isRecursive ) ;

(If `src` contains multiple directories, findfiles.m will be called iteratively,
with `mFiles` accordingly appended.)

NOTE/TODO: Handling the case where multiple directories are included and
`isRecursive == true`. There is the potential here to include directories
multiple times (can be easily filtered out ahead of time using
Pathologist.subfolders -- just need to implement the filter). More
importantly, a folder the user didn't really want included might be included
anyway if it happens to be a sub of one that was specified... Should a
warning be issued?

__ETC__

- standalone function: findfiles.m
- Examiner.mfiletype

See also
FINDFILES

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : varargin
- OutputNames : mFiles
- DefiningClass : Documentor
 
</details>

---


### draftdoccontent

**Synopsis**: _Generates and assigns formatted documentation to `docContent`_ 

      
      Dr.draftdoccontent( )
      Dr.draftdoccontent( detailLevel )

Calls `Examiner` to retrieve info on the file assigned to `Dr.mFile` and
assigns a formatted string vector to `Dr.docContent` which can then be
printed to file via `Dr.printdoc()`.

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : varargin
- OutputNames : varargout
- DefiningClass : Documentor
 
</details>

---


### printYml

**Synopsis**: _print yml configuration file according to docFiles_ 

__Syntax__

    [] = PRINTYML( Self, filePath) 
    [] = PRINTYML( Self, filePath, Params) 

__OPTIONS__

`filePath` is the path of the file where the .yml file will be generated

`Params.theme` is a character vector containing the name of the them to
use

`Params.projectName` is a character vector of the name of the project
(will be displayed as the site name)

% `Params.home` is a character vector of the homepage (default value is
'index.md')

`Params.repoURL` is a character vector that specifies the link to the
remote directory.

for the Yml configuration file to work, the documentation must be in a
folder called docs in the same folder

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : varargin
- OutputNames : varargout
- DefiningClass : Documentor
 
</details>

---


### empty

**Synopsis**: _Returns an empty object array of the given size_ 

<details>
<summary><b>Details</b></summary>
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | true  |

- Access : public
- InputNames : varargin
- OutputNames : E
- DefiningClass : Documentor
 
</details>

---

### eq
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### ne
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### lt
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### gt
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### le
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### ge
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### delete
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### isvalid
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### findprop
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### notify
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### notify
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### addlistener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### listener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### addlistener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### listener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### addlistener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### listener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### addlistener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### listener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### addlistener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### listener
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.

---

### findobj
— _built-in method derived from class_ **handle**. 
For more info, refer to the MATLAB documentation.
