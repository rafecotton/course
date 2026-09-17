-- Jinja variables and dbt (project) variables

{% macro learn_variables() %}

    {# Jinja #}
    {% set your_name_jinja = "Rafe" %} 
    {{ log("Hello " ~ your_name_jinja, info = True) }}

    {# dbt #}
    {# { log(" Hello dbt user " ~ var("user_name", "DEFAULT_user_name") ~ "!", info = True )} #}
    {{ log(" Hello dbt user " ~ var("user_name") ~ "!", info = True )}}

{% endmacro %}