{{#intro}}

Sometimes, you need a quick token to access the GitHub API. HTTPS Basic Auth is a quick and easy solution, but it's not always the most secure. For those cases, you can use Personal Access Tokens instead. These work the same as OAuth tokens generated through the API, and can be created through the web UI.

{{/intro}}

GitHub makes it very easy to generate a new OAuth token for quick API usage. You'd use this token in scenarios where a full-fledged app with a client/secret pair is too large for your needs, such as a command-line utility or script.

Every token generated from the UI can have [any kind of scope](https://developer.github.com/v3/oauth/#scopes) that you grant.

For more technical information on the process of using authorization tokens, see "[Create a new authorization](https://developer.github.com/v3/oauth/#create-a-new-authorization)" in the GitHub API.

{{#tip}}

We recommend that you regularly [review your authorized applications list](/articles/keeping-your-application-access-tokens-safe) and remove any applications that haven't been used in a while.

{{/tip}}

### Creating a token

1. Go to your [Applications](https://github.com/settings/applications)
   ![Applications menu](https://github-images.s3.amazonaws.com/help/settings/applications.png)
3. Click **Generate new token**
   ![Generate new token button](https://github-images.s3.amazonaws.com/help/settings/generate_new_token.png)
4. Give your token a descriptive name
   ![Token description field](https://github-images.s3.amazonaws.com/help/settings/token_description.png)
6. Select which scopes you wish to grant to this token.
5. Click **Generate token**
   ![Generate token button](https://github-images.s3.amazonaws.com/help/settings/generate_token.png)
6. Copy the token and use it like a password for the API or for git over HTTPS.
   ![Newly created token](https://github-images.s3.amazonaws.com/help/settings/personal_access_tokens.png)

Remember to **keep your tokens secret**; treat them just like passwords! Don't hardcode them into your programs, instead opting for environment variables.

When you're done using your token, feel free to click **Delete** to get rid of it permanently.
