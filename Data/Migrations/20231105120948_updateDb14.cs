using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Final_DotNet.Migrations
{
    /// <inheritdoc />
    public partial class updateDb14 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "isReview",
                table: "Orders");

            migrationBuilder.AddColumn<bool>(
                name: "isReview",
                table: "OrderDetails",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "isReview",
                table: "OrderDetails");

            migrationBuilder.AddColumn<bool>(
                name: "isReview",
                table: "Orders",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
