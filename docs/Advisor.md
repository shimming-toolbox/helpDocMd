# Advisor

**Filetype:** _MATLAB&reg; classdef_

**Synopsis:** _Templates and tools for documenting code_

Advisor provides templates for writing help entries to new MATLAB files

WIP

    Documentation for Advisor
       doc Advisor

<details>
<summary><b>Details</b></summary>
 

| Attribute            | Value |
|:--------------------:|:-----:|
| Hidden               | false |
| Sealed               | false |
| Abstract             | true  |
| Enumeration          | false |
| ConstructOnLoad      | false |
| HandleCompatible     | false |
| RestrictsSubclassing | false |

- InferiorClasses : [N/A] 
- ContainingPackage : [N/A] 
- EventList : [N/A] 
- EnumerationMemberList : [N/A] 
- SuperclassList : [N/A] 
 
</details>

- - -
## Properties

 
-----
 
### isCopying

**Synopsis:** _Advisor/isCopying is a property._

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
| DefaultValue  | false |

- GetAccess : public
- SetAccess : public
- PartialMatchPriority : [N/A] 
- GetMethod : 
- SetMethod : 
- Validation : [N/A] 
- DefiningClass : Advisor
 
</details>

---
## Methods


---


### Advisor

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
- InputNames : [N/A] 
- OutputNames : Ad
- DefiningClass : Advisor
 
</details>

---


### references

**Synopsis**: _Suggested references_ 


...

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
- InputNames : [N/A] 
- OutputNames : [N/A] 
- DefiningClass : Advisor
 
</details>

---


### recommendations

**Synopsis**: _On technical writing_ 


...

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
- InputNames : [N/A] 
- OutputNames : [N/A] 
- DefiningClass : Advisor
 
</details>

---


### template

**Synopsis**: _Templates for documentting new .m files_ 

should return (more importantly) + *define* a template for .m help documentation:
for basic scripts, functions, class definitions, etc.

should also be able print to a new file.m (w/out overwrite option)

DEFAULT.link[1]: http://en.wikipedia.org/wiki/Markdown        "Markdown"

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
- InputNames : [N/A] 
- OutputNames : [N/A] 
- DefiningClass : Advisor
 
</details>

---


### function_template

**Synopsis**: _Provides a template for function help entries_ 

      
      [txt] = function_template( )

`function_template` returns the template as a string vector `txt`.

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
- InputNames : pathIn
- OutputNames : txt
- DefiningClass : Advisor
 
</details>

---


### txttable

**Synopsis**: _Create and [return|copy|print] a character table_ 

    [~] = txttable( 1, nSize, nSizeCell, "%" ) 

Copies an empty character table with `nSize(1)` rows and `nSize(2)` columns
to the clipboard and prints to the standard output. nSizeCell(2) sets the
number of ' ' spaces each cell is allotted in the horizontal dimension.
(Note: nSizeCell(2) is not yet used/implented.)

1. Example

>> Helper.txttable(1,[3 5],[1 10])% outputs:
'
|          |          |          |          |          |
|----------|----------|----------|----------|----------|
|          |          |          |          |          |
|          |          |          |          |          |


When called without any input or output arguments, TABLE prints the
to the standard output.
When the first input is `[ 1 | true ]`,`txt` is copied to the clipboard.

__DESCRIPTION__

To suppress the print display, call the function with a return argument,
e.g. using the dummy argument `[~] = txttable();`.

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
- OutputNames : txt
- DefiningClass : Advisor
 
</details>

---


### readme

**Synopsis**: _Create [return|copy|print] README text with title, sections, & index/ToC_ 

    
    []    = readme( [false] ) 
    [txt] = readme(  ) 

When called without any input or output arguments, README prints the
character vector of default 'readme' content `txt` to the standard output.
To suppress the print display, call the function with a return argument,
e.g. using the dummy argument `[~] = readme();`.

When the first input is `[ 1 | true ]`, the `txt` is copied to the clipboard.
This should be adequate for most cases: Paste to your file and begin editing.

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
- OutputNames : txt
- DefiningClass : Advisor
 
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
- DefiningClass : Advisor
 
</details>
