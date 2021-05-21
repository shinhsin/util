#include <linux/init.h>
#include <linux/module.h>

MODULE_DESCRIPTION("Hello module.");
MODULE_LICENSE("GPL");


static int hello_init(void)
{
    printk(KERN_INFO "Hello Module init.\n");
    return 0;
}


static void hello_exit(void)
{

    printk(KERN_INFO "Hello Module Bye!\n");
    return;
}

module_init(hello_init);
module_exit(hello_exit);
