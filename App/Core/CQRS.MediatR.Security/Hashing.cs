using Effortless.Net.Encryption;
using System;

namespace CQRS.MediatR.Security
{
    public class Hashing
    {
        public (string hash, string salt) GenerateHashWithSalt(string data)
        {
            string salt = Strings.CreateSalt(20);
            
            string hash = Hash.Create(HashType.SHA512, salt + data , string.Empty, false);
            return (hash, salt);
        }

        public bool ValidatePassword(string password, string hash, string salt)
        {
            string hashForGivenPassword = Hash.Create(HashType.SHA512, salt + password, string.Empty, false);

            if (hash == hashForGivenPassword)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
