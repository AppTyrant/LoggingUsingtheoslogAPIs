
find-largest-file
=================

The find-largest-file sample project demonstrates a simple use case of some of the logging APIs in C. Covered topics include:

- When to use the available log levels

- Format specifiers for printing specific types

- `{public}` and `{private}` modifiers

For a more in-depth sample of the os_log APIs (including profile support and usage), please see the Paper Company sample code.


Using the Sample
================

The sample code requires Xcode 8 or later and the macOS 10.12 SDK or later. find-largest-file recursively searches a given directory to find the file of maximum size. To change the default directory (`/Applications/`), select `Product > Scheme > Edit Scheme...`. Select `Run` on the left, then `Arguments` at the top. Edit the first item in `Arguments Passed on Launch` to change the default directory to search.
