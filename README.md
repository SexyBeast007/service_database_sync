# service_database_sync
    - Using Back4App Parse for database event logging

# Project purpose:
    - Main purpose is to demo the use of a Back4App database as a master database change log
    - To become familiar with Back4App as a Backend As a Service BaaS
    - Become familiar with CRUD actions while using Parse Back4App

# This project features:
    - CRUD actions as part of the Back4App SDK
    - To json parsing

# MAJOR ISSUE:
    Problem: For the production app version, the "Book" values will be encrypted by Hive 256 AES.
    This creates the challenge that if the Parse Back4App database is a master database change log,
    then how do other local client databases decrypt encrypted data if they do not have access to the keys.
    The keys would be locally stored by whomever initiated a database action.
    It must be figured out how to share the key securely across authorized users without creating any possible vulnerability.

# TODO:
    - Handle inter-device encryption issue
    - Create read event for building database changes at local database
