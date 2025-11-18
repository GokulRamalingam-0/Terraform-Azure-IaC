#!/bin/bash

# Variables
RESOURCE_GROUP_NAME="YourResourceGroupName"
STORAGE_ACCOUNT_NAME="tfstate41601"
LOCATION="westus"

# Login to Azure
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID

# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create Storage Account
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS
