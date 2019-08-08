# encoding: utf-8
# language: en

Feature: A user adds a PDF
  Given that the user is logged in and has the role teacher
  When they click add thing
  And fill in metadata for the thing regarding
    | creator(s)           |
    | creator type         |
    | title                |
    | length of the donkey |
  And set access privileges for the thing
  And add the file for upload
  And click OK
  Then they receive a receipt containing information about
    | receipt id        |
    | owner             |
    | owner institution |
    | file location     |
    | file checksum     |
    | Handle id         |
    | file version      |
    | metadata summary  |