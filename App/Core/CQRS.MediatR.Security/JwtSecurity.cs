using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace CQRS.MediatR.Security
{
    public class JwtSecurity
    {
        public string JwtSecurityTokenGenerator(string JwtSecurityKey
                                              , DateTime tokenExpiration
                                              , string userName)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name, userName)
            };

            var Key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtSecurityKey));
            var creds = new SigningCredentials(Key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
            issuer: "yourdomain.com",
            audience: "yourdomain.com",
            claims: claims,
            expires: tokenExpiration,
            signingCredentials: creds);

            string jwtToken = new JwtSecurityTokenHandler().WriteToken(token);

            return jwtToken;
        }
    }
}