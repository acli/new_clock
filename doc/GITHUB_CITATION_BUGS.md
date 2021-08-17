After about three hours of very bewildered debugging,
I discovered that GitHub’s CITATION.cff support is buggy:

1. It requires the *version* key to be present;
   the [official CITATION.cff schema](https://github.com/citation-file-format/citation-file-format/blob/main/schema.json)
   – and in fact even the [schema guide](https://github.com/citation-file-format/citation-file-format/blob/main/schema-guide.md)
   that GitHub’s CITATION file help page links to –
   lists only four required keys: *authors*, *cff-version*, *message*
   (very strange because it has a default value) and *title*.
2. It requires that a BOM be *not* present;
   the [YAML specification](http://yaml.org/spec/1.2/spec.html)
   explicitly states that BOM can appear at the beginning of the file.

In addition, after getting the cff to parse,
GitHub’s so-called APA citation is clearly not APA;
it appears to be in IEEE or some other kind of Vancouver style.
