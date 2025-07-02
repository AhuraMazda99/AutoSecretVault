# Automated Secret Lifecycle

This project demonstrates an automated approach for managing Azure service principal secrets. The Bicep templates deploy a Key Vault and Logic Apps that rotate and purge secrets on a schedule. After deployment, secrets are stored in the vault so that release pipelines can retrieve them when required.

## How it Works

1. **Key Vault Deployment**
   The `Keyvault` module provisions a vault that will contain the service principal secrets. Specify the object ID of an administrator in `Keyvault.bicep` so this user has initial access. After deployment, you'll grant the Logic App's managed identity access so it can write secrets directly.
2. **Logic Apps**  
   Two workflows are deployed:
   - `deploy_autorate_secrets.bicep` rotates secrets on a recurring schedule.
   - `deploy_delete_secrets.bicep` deletes old secrets after rotation.
3. **Secret Storage**  
   Once the solution is deployed, the names (or name prefixes) of the service principals to rotate are added to the Key Vault. The Logic Apps use these entries to update each service principal and store the new secrets back in the vault.
4. **Secret Retrieval**
   Pipelines or other consumers read updated secrets from this Key Vault using its URL and an identity with access.

## Deployment Steps

1. Deploy the top-level `Main.bicep` template to create the Key Vault and Logic Apps.
2. After deployment, add the names (or starting text) of each service principal you want rotated to the Key Vault as secrets. The Logic App will act on all matching service principals.
3. Assign a managed identity to the Logic App and add its object ID to the Key Vault's access policies so the workflow can write secrets without using a service principal.
4. Provide the Key Vault URL to the Automated rotation workflow. 
5. deployment code
    Code: 
        az deployment sub create --location westeurope --template-file Main.bicep --parameters object_id_keyvault=<your-object-id-for-admin>


This setup ensures service principal secrets are rotated automatically and available to your CI/CD workflows when needed.

Code to retrieve key from keyvault : az keyvault secret show --name <object id of the principal you want to retrieve> --vault-name <Keyvault name you deployed>

## Future Improvement

The Logic App currently uses a service principal to obtain an Azure AD token for Graph API calls. Moving these calls to a managed identity would remove the remaining dependence on a service principal.