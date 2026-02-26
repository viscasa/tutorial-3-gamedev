<div align="center">
    <h2>Alwie Attar Elfandra</h2>
    <h2>2306241726</h2>
</div>

## Fitur tambahan:

1. Double Jump :
    
    Cara implementasinya adalah dengan menambahkan variabel jump_count dan max_jumps. Jump count akan direset menjadi 0 ketika player menyentuh tanah. Jump count akan bertambah 1 ketika player melompat. Jika jump count lebih besar dari 0, player bisa melompat lagi.
2. Crouch :
    
    Cara implementasinya adalah dengan menambahkan variabel is_crouching. Jika is_crouching true, player akan bergerak lebih lambat dan collision shape akan berubah menjadi lebih kecil. Jika is_crouching false, player akan bergerak lebih cepat dan collision shape akan berubah menjadi lebih besar.
3. Flip Sprite :
    
    Cara implementasinya adalah dengan menambahkan variabel flip_h. Jika flip_h true, player akan bergerak ke kiri. Jika flip_h false, player akan bergerak ke kanan. 