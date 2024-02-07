{% macro margin_percent(revenue, purchase_cost,decimal=2) %}
    round(safe_divide({{revenue}}-{{purchase_cost}},{{revenue}}),{{decimal}})
{% endmacro %}


