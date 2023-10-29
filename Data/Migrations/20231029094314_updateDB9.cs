using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_DotNet.Migrations
{
    /// <inheritdoc />
    public partial class updateDB9 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "id",
                table: "OrderDetails",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "id",
                table: "OrderDetails");
        }
    }
}
