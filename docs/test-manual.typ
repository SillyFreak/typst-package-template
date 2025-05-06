#import "template.typ" as template: *
#import "/src/lib.typ" as PACKAGE

#let greet(name) = [Hello #name]

#show: manual(
  package-meta: toml("/typst.toml").package,
  // date: none,
  // date: datetime(year: ..., month: ..., day: ...)
  date: datetime.today(),

  logo: rect(width: 5cm, height: 5cm),
  abstract: [
    A PACKAGE for something #lorem(80)
  ],

  scope: (PACKAGE: PACKAGE, greet: greet),
)

#show link: set text(fill: rgb("#1e8f6f"))
#show link: underline

= Introduction

This is a PACKAGE for something, providing #ref-fn("greet()").
#context text.size

```example
= Heading

#greet[World]
#context text.size
```

#preview-block[
  = Heading

  #greet[World]
  #context text.size
]

= Module reference

#module(
  ````typ
  /// Greets someone @@greet()
  /// #context text.size
  ///
  /// ```example
  /// = Heading
  ///
  /// #greet[World]
  /// #context text.size
  /// ```
  ///
  /// ```typ
  /// #greet[World]
  /// ```
  ///
  /// #test(
  ///   `1 == 1`,
  /// )
  ///
  /// -> content
  #let greet(
    /// The name of the one to greet
    ///
    /// -> string
    name,
  ) = [Hello #name]
  ````.text,
  name: "PACKAGE",
  label-prefix: none,
)
