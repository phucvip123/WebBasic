namespace Models.Product
{
    public class Product
    {
        public int id { get; set; }
        public string name { get; set; }
        public string loai { get; set; }
        public int price { get; set; }
        public int soLuong { get; set; }
        public int ram { get; set; }
        public int rom { get; set; }
        public string hang { get; set; }
        public int namSX { get; set; }
        public string cpu { get; set; }
        public float sizeMH { get; set; }
        public int[] phanGiai { get; set; }
        public int pin { get; set; }
        public int doSang { get; set; }
        public string mauSac { get; set; }
        public string description { get; set; }
        public int img { get; set; }

        public Product(int id, string name, string loai, int price, int soLuong, int ram, int rom, string hang, int namSX, string cpu, float sizeMH, int[] phanGiai, int pin, int doSang, string mauSac, string description, int img)
        {
            this.id = id;
            this.name = name;
            this.loai = loai;
            this.price = price;
            this.soLuong = soLuong;
            this.ram = ram;
            this.rom = rom;
            this.hang = hang;
            this.namSX = namSX;
            this.cpu = cpu;
            this.sizeMH = sizeMH;
            this.phanGiai = phanGiai;
            this.pin = pin;
            this.doSang = doSang;
            this.mauSac = mauSac;
            this.description = description;
            this.img = img;
        }
    }
}