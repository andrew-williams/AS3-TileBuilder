package core {
	
	public class TileDescriptions {

		public function TileDescriptions() {}
		
		public function GetDescription(tileID:int):String{
			var desc:String = "";
			switch (tileID){
				case 1:
					desc = "This is a cleared tile.";
					break;
				case 2:
					desc = "This is a lone tile.";
					break;
				case 3:
					desc = "This is a flat tile.";
					break;
				case 4:
					desc = "This tile has South opening.";
					break;
				case 5:
					desc = "This tile has West opening.";
					break;
				case 6:
					desc = "This tile has East opening.";
					break;
				case 7:
					desc = "This tile has North opening.";
					break;
				case 8:
					desc = "This is a North/South tile.";
					break;
				case 9:
					desc = "This is a East/West tile.";
					break;
				case 10:
					desc = "This tile connects South to West.";
					break;
				case 11:
					desc = "This tile connects South to East.";
					break;
				case 12:
					desc = "This tile connects North to West.";
					break;
				case 13:
					desc = "This tile connects North to East.";
					break;
				case 14:
					desc = "This is a Top Right corner piece.";
					break;
				case 15:
					desc = "This is a Top Left corner piece.";
					break;
				case 16:
					desc = "This is a T Piece with North wall.";
					break;
				case 17:
					desc = "This is a T Piece with East wall.";
					break;
				case 18:
					desc = "This is a T Piece with West wall.";
					break;
				case 19:
					desc = "This is a T Piece with South wall.";
					break;
				case 20:
					desc = "This is a Bottom Right corner piece.";
					break;
				case 21:
					desc = "This is a Bottom Left corner piece.";
					break;
				case 22:
					desc = "This is a T with South East corner with North wall.";
					break;
				case 23:
					desc = "This is a T with North West corner with East wall.";
					break;
				case 24:
					desc = "This is a T with South West corner and North wall.";
					break;
				case 25:
					desc = "This is a tile with open South East corner.";
					break;
				case 26:
					desc = "This is a + Tile.";
					break;
				case 27:
					desc = "This is a T with South West corner and East wall";
					break;
				case 28:
					desc = "This is a T with South East corner and West wall.";
					break;
				case 29:
					desc = "This is a T with North East corner and South wall.";
					break;
				case 30:
					desc = "This is a T with North West corner and South wall.";
					break;
				case 31:
					desc = "This is a tile with North wall";
					break;
				case 32:
					desc = "This is a tile with open South West corner.";
					break;
				case 33:
					desc = "This is a tile with East wall";
					break;
				case 34:
					desc = "This is a tile with open South East corner.";
					break;
				case 35:
					desc = "This is a tile with West wall";
					break;
				case 36:
					desc = "This is a tile with open North West corner.";
					break;
				case 37:
					desc = "This is a tile with open North East corner.";
					break;
				case 38:
					desc = "This is a tile with South wall";
					break;
				case 39:
					desc = "This tile has walls on North corners.";
					break;
				case 40:
					desc = "This tile has walls on East corners.";
					break;
				case 41:
					desc = "This tile has walls on North West and South East corners.";
					break;
				case 42:
					desc = "This tile has walls on North East and South West corners.";
					break;
				case 43:
					desc = "This tile has walls on West corners.";
					break;
				case 44:
					desc = "This tile has walls on South corners.";
					break;
				case 45:
					desc = "This tile has a wall at North East.";
					break;
				case 46:
					desc = "This tile has a wall at North West.";
					break;
				case 47:
					desc = "This tile has a wall at South East.";
					break;
				case 48:
					desc = "This tile has a wall at South West.";
					break;
				default:
					desc = "undefined description";
					break;
			}
			return desc;
		}
	}
	
}
