{% test be_greater_than_or_equal_to(model, column_name, value=0) %}

select
    *
from {{ model }}
where {{ column_name }} < {{ value }}

{% endtest %}