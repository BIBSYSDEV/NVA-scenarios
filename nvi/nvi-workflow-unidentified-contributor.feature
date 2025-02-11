Feature: NVI-candidates with unidentified users

  # @test
  Scenario Outline: Identify publication as NVI candidate
    Given a publication of "<Type>" published in the active period
    And the publication has at least one publication channel of type "<Channel>" with scientific level of one or two
    And the publication has at least one Author affiliated with an NVI institution
    And the publication is not previously reported
    Then the publication is identified as an NVI candidate

    Examples:
      | Type                     | Channel   |
      | AcademicArticle          | journal   |
      | AcademicChapter          | publisher |
      | AcademicChapter          | series    |
      | AcademicLiteratureReview | journal   |
      | AcademicMonograph        | publisher |
      | AcademicMonograph        | series    |
      | AcademicCommentary       | publisher |
      | AcademicCommentary       | series    |

#     Scenario: Institution can approve/reject when all their contributors are identified
#         Given a publication identified as an NVI candidate
#         And Institution A is an NVI institution
#         And all Authors affiliated with Institution A are identified
#         Then Institution A can approve or reject the candidate

#     Scenario: Institution cannot approve/reject when they have any non-identified contributors
#         Given a publication identified as an NVI candidate
#         And Institution A is an NVI institution
#         And Institution A has at least one non-identified Author
#         Then Institution A cannot approve or reject the candidate

#     Scenario: NVI points per institution include only identified contributors
#         Given a publication identified as an NVI candidate
#         And Institution A is an NVI institution
#         And Institution A has both identified and non-identified Authors
#         Then the calculated NVI points for Institution A will include the shares of their identified contributors
#         And will not include the shares of their non-identified contributors

#     Scenario: NVI points are recalculated when the number of identified contributors changes
#         Given a publication identified as an NVI candidate
#         And Institutions A and B are NVI institutions
#         And Institution B has at least one identified Author
#         When the number of identified Authors affiliated with Institution A changes
#         Then the NVI points for Institution A are recalculated accordingly
#         And the NVI points for Institution B remain unchanged
#     Scenario: Handle deadlocks when period closes
#         Given a publication identified as an NVI candidate
#         And Institutions A and B are NVI institutions
#         And all Authors affiliated with Institution A are identified
#         And Institution B has at least one unidentified Author
#         When the active period closes and NVI points are reported
#         Then Institution A is awarded NVI-points
#         And Institution B is not awarded NVI-points
# # The current implementation in Cristin requires the removal of the Institution B
# # affiliation before Institution A can be awarded NVI points. However, this approach
# # is not desired in the NVA implementation. The affiliation with Institution B is
# # likely correct, but it has not yet been verified.
# # It must be clearly visible on the front end that Institution B did not receive NVI points.
