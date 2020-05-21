configuration GroupTest
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Node localhost
    {
        Group GroupTest
        {
            GroupName        = 'Power Users'
            Ensure           = 'Present'
            MembersToInclude = 'lothbrok\gmsa1$'
        }
    }
}