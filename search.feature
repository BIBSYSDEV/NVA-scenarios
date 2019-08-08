# encoding: utf-8
# language: en

Feature: A user searches for an item
  Given that a user is on the start page and is not logged in
  And there are three documents with the word Norway in the title
  When the user enters Norway into the search input
  Then they see hits for Norway displayed in the search display

Feature: A user finds an item
  Given that a user has searched for Norway
  When they click a search result
  Then they see the item page for that result