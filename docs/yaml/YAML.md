# YAML

**Filetype:** _MATLAB&reg; classdef_

**Synopsis:** _Serialize a matlab variable to yaml format_

[ X ] = YAML.load( S )
[ S ] = YAML.dump( X )

[ X ] = YAML.read( filepath )
YAML.write( filepath, X )

YAML.LOAD takes YAML string S and returns matlab variable X.
YAML.DUMP takes matlab variable X and converts to YAML string S.
YAML.READ and YAML.WRITE are convenient methods to load and dump
YAML format directly from a file.

Examples:
To serialize matlab object

    >> X = struct('matrix', rand(3,4), 'char', 'hello');
    >> S = YAML.dump(X);
    >> disp(S);
    matrix:
    - [0.9571669482429456, 0.14188633862721534]
    - [0.4853756487228412, 0.421761282626275]
    - [0.8002804688888001, 0.9157355251890671]
    char: hello

To decode yaml string

    >> X = YAML.load(S);
    >> disp(X)
      matrix: [3x2 double]
        char: 'hello'

See also: xmlread xmlwrite

    Documentation for YAML
       doc YAML

<details markdown="block">
 

| Attribute            | Value |
|:--------------------:|:-----:|
| Hidden               | false |
| Sealed               | false |
| Abstract             | false |
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
 
### JARFILE

**Synopsis:** _YAML.JARFILE is a property._

<details markdown="block">
 
| Attribute     | Value |
|:-------------:|:-----:|
| Dependent     | false |
| Constant      | true  |
| Abstract      | false |
| Transient     | false |
| Hidden        | false |
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
- DefaultValue : /Users/ryan/Projects/General/scripts/helpDocMd/src/yaml/java/snakeyaml-1.9.jar
- Validation : [N/A] 
- DefiningClass : YAML
 
</details>

---
## Methods


---


### write

**Synopsis**: _serialize and write yaml data to file_ 

 WRITE serialize and write yaml data to file

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : filepath, X
- OutputNames : [N/A] 
- DefiningClass : YAML
 
</details>

---


### read

**Synopsis**: _read and decode yaml data from file_ 

 READ read and decode yaml data from file

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : filepath
- OutputNames : X
- DefiningClass : YAML
 
</details>

---


### dump

**Synopsis**: _serialize matlab object into yaml string_ 

 DUMP serialize matlab object into yaml string

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : X
- OutputNames : S
- DefiningClass : YAML
 
</details>

---


### load

**Synopsis**: _load matlab object from yaml string_ 

 LOAD load matlab object from yaml string

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : S
- OutputNames : X
- DefiningClass : YAML
 
</details>

---


### jarfile

**Synopsis**: _path to the SnakeYAML jar file_ 

 JARFILE path to the SnakeYAML jar file

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : [N/A] 
- OutputNames : S
- DefiningClass : YAML
 
</details>

---


### dump_data

**Synopsis**: _convert_ 

 DUMP_DATA convert

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : private
- InputNames : r
- OutputNames : result
- DefiningClass : YAML
 
</details>

---


### merge_cell

**Synopsis**: _convert cell array to native matrix_ 

 MERGE_CELL convert cell array to native matrix

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : private
- InputNames : r
- OutputNames : result
- DefiningClass : YAML
 
</details>

---


### load_data

**Synopsis**: _recursively convert java objects_ 

 LOAD_DATA recursively convert java objects

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | true  |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : private
- InputNames : r
- OutputNames : result
- DefiningClass : YAML
 
</details>

---


### YAML

**Synopsis**: _Constructor_ 

<details markdown="block">
 

| Attribute          | Value |
|:------------------:|:-----:|
| Static             | false |
| Abstract           | false |
| Sealed             | false |
| ExplicitConversion | false |
| Hidden             | false |

- Access : public
- InputNames : [N/A] 
- OutputNames : obj
- DefiningClass : YAML
 
</details>

---


### empty

**Synopsis**: _Returns an empty object array of the given size_ 

<details markdown="block">
 

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
- DefiningClass : YAML
 
</details>
