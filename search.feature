# encoding: utf-8
# language: en

Feature: A user searches for a resource
  Given that a user is on the start page and is not logged in
  And there are three documents with the word Norway in the title
  When the user enters Norway into the search input
  And clicks Search
  Then the user sees hits for Norway displayed in the search display

Feature: A user finds a resource
  Given that a user has searched for Norway
  When they click a search result
  Then they see the resource page for that result