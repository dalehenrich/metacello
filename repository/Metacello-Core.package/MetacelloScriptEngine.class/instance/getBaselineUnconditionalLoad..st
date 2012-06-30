project lookup
getBaselineUnconditionalLoad: unconditionalLoad
    | spec |
    spec := self baselineProjectSpec.
    Smalltalk
        at: spec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (spec := self lookupProjectSpecFor: spec) projectPackage load.
    ^ Smalltalk at: spec className asSymbol