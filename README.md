HOW TO: 

Create users CSV file: 

    -> name of column: domain_name
    -> first row of document: must contain domain_name column name
    -> all rows under domain_name are values
    -> values must contain '.' (like first_name.last_name)

installing supervisor
    -> sudo apt-get install supervisor

Starting queue

    -> go to project base directory
    -> php artisan queue:work