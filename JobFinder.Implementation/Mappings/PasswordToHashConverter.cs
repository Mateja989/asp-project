using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;

namespace JobFinder.Implementation.Mappings
{
    public class PasswordToHashConverter : IValueConverter<string, string>
    {
        public string Convert(string sourceMember, ResolutionContext context)
        {
            return BCrypt.Net.BCrypt.HashPassword(sourceMember);
        }
    }
}
