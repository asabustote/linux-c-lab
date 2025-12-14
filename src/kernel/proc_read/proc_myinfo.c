#include <linux/init.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/uaccess.h>

#define PROC_NAME "myinfo"

static ssize_t myinfo_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
{
    const char *msg = "Hello from kernel module!\n";
    return simple_read_from_buffer(buf, count, ppos, msg, strlen(msg));
}

static const struct proc_ops myinfo_fops = {
    .proc_read = myinfo_read,
};

static int __init myinfo_init(void)
{
    proc_create(PROC_NAME, 0, NULL, &myinfo_fops);
    pr_info("myinfo module loaded\n");
    return 0;
}

static void __exit myinfo_exit(void)
{
    remove_proc_entry(PROC_NAME, NULL);
    pr_info("myinfo module unloaded\n");
}

module_init(myinfo_init);
module_exit(myinfo_exit);

MODULE_LICENSE("GPL");
