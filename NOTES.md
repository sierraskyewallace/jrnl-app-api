Jrnl API:

[x]1. Create git repo 
[x]2. Create a new branch for User scaffold
[x]3. Create User model, migration and Namespaced v1 controller
[x]4. Test INDEX for User model, then create and create a user with JUST a username 
[x]5. Ensure User functionality works 100%
[]6. CO branch and merge to master if 100%
[]7. Create a new branch for journal entry scaffold 
[]8. Create Journal model, migration and Namespaced v1 controller
[]9. Test INDEX for Journal model, then create and create a journal entry 
[]10. Ensure Journal functionality works 100%
[]11. CO branch and merge to master if 100%
[]12. Check user and journal entry relationship   user has many journal entires, entries belong to user
[]13. Recheck requirements and videos and ensure back end 100% done. 
[]14. Move onto Front end 

////////////////////////////////

User:
has many journal entries

username:string

Journal Entry:
belongs_to: user

title:string
content:text?
user_id:integer
image:blob?
