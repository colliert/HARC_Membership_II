# Discrepancies in   Membership roles.

There are a few fields in HamClubOnline regarding membership and voting privileges.

---
The first is *roster status* (Roster Status)
We currently have values of:
- '*Active*', 
- '*Inactive*', and 
- '*Deceased(SK)*'.

---

the next is *mem_typ* (Membership Type)
Our membership types are currently:
- *Full Member*, 
- *Associate Member*, 
- *Family Member*

---

The last is *club_rank* (The member's level in HARC).
Currently we have:
- *Voting Member*
- *Non-Voting Member*
- *Officer*

---

Those that are allowed to vote have the following characteristics:
- Roster Status is *Active*
- Membership Type is *Full Member*, *Officer* or *Family Member* who is a Full Member, by virtue of having a *callsign*,
- Club rank is *Voting Member* although this could be derived from Membership Type.

At this time we make no distinction between Family Members who have a call sign (and are, therefor a Full Member)
and those that do not (and are, therefore, Associate Members).
They are listed only as "Family Member".

## Recommendation

There is a little bit of cleanup work that should be performed to keep the HamClubOnline database as pristine
as possible; we are treating HCOL as the *System of Record* or the *Single Source of Truth*.

Included here will be a few tables showing different discrepancies.

### Members with no call signs who are Voting Members.

|Member_Number|Roster_Status|Member_Type|First_Name|Last_Name|Call|club_rank|
|---|---|---|---|---|---|---|
|35621|Active|Full Member|Tod|Cox|(none)|Voting Member|
|32090|Active|Family Member|James|Taylor|(none)|Voting Member|
|31930|Active|Family Member|Deanne|Widmark|(none)|Voting Member|

No call sign implies no license, and only fully licensed amateurs may be full members.  And
only Full Members may be Voting Members. Change *Club Rank* to "Non-Voting".

### Silent Keys who are still listed as Voting Members

|Member_Number|Roster_Status|Member_Type|First_Name|Last_Name|Call|club_rank|
|---|---|---|---|---|---|---|
|26093|Deceased (SK)|""|Anthony|Dinkel|(none)|Voting Member|
|24405|Deceased (SK)|""|Earl|Lizardi|(none)|Voting Member|
|24388|Deceased (SK)|""|Douglas|Smith|(none)|Voting Member|

Perhaps we should consider adding a Club Rank of '*Silent Key*' or '*Deceased*'.
In any event, we should, at the minimum, make them '*Non-Voting Members*'.

Also, sadly, we have to change Robert (Bob) Dorsey's '*Roster Status*' to '*Deceased(SK)*'

### Split the "Family Member" designation into two different designations.
Finally, we may want to give consideration to splitting the '*Family Member*' into two parts;
'*Family Member - Full Member*' and '*Family Member - Associate Member*'.  There would be no change to
the dues structrue, but only the '*Family Member - Full Member*' is allowed to cast a ballot.  There may be better
titles for these Family Memberships.

Of course, whether a *Family Member* can cast a ballot can be derived from:
```
If the member is a "Family Member" and they have a call sign then
    the member is a "Full Member" and are allowed to vote.
Otherwise, if the member is a "Family Member" with no call sign then
    the member is an "Associate Member" and is not allowed to vote.
```
Even though the results can be derived, it would be better to explicitly list the type
of "Family Member" in the HamClubOnline data to avoid confusion.
