Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A011BE4E
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 21:48:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y8C36FY6zDqfG
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 07:47:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y8Bw57YwzDqDy
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 07:47:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBKkEsG084395; Wed, 11 Dec 2019 15:47:36 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wt2kuwrpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 15:47:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBBKe1vJ005636;
 Wed, 11 Dec 2019 20:43:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2wr3q6r70d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 20:43:55 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBKhsMh54133096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 20:43:54 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 061906E053;
 Wed, 11 Dec 2019 20:43:54 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D5D96E04C;
 Wed, 11 Dec 2019 20:43:53 +0000 (GMT)
Received: from [9.211.120.71] (unknown [9.211.120.71])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 20:43:53 +0000 (GMT)
Subject: Re: [PATCH v2 07/12] drivers/soc: xdma: Add user interface
To: Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
 <1575566112-11658-8-git-send-email-eajames@linux.ibm.com>
 <d97de592-d3c6-4683-ab36-4ea2e8bd27b7@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <d5eee648-fc35-5f9e-9c73-5fa76a6e04c9@linux.ibm.com>
Date: Wed, 11 Dec 2019 14:43:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d97de592-d3c6-4683-ab36-4ea2e8bd27b7@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_06:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912110169
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 12/10/19 9:48 PM, Andrew Jeffery wrote:
>
> On Fri, 6 Dec 2019, at 03:45, Eddie James wrote:
>> This commits adds a miscdevice to provide a user interface to the XDMA
>> engine. The interface provides the write operation to start DMA
>> operations. The DMA parameters are passed as the data to the write call.
>> The actual data to transfer is NOT passed through write. Note that both
>> directions of DMA operation are accomplished through the write command;
>> BMC to host and host to BMC.
>>
>> The XDMA engine is restricted to only accessing the reserved memory
>> space on the AST2500, typically used by the VGA. For this reason, the
>> VGA memory space is pooled and allocated with genalloc. Users calling
>> mmap allocate pages from this pool for their usage. The space allocated
>> by a client will be the space used in the DMA operation. For an
>> "upstream" (BMC to host) operation, the data in the client's area will
>> be transferred to the host. For a "downstream" (host to BMC) operation,
>> the host data will be placed in the client's memory area.
> Given the comments on earlier patches we should reconsider descriptions
> of the VGA area in this paragraph.
>
>> Poll is also provided in order to determine when the DMA operation is
>> complete for non-blocking IO.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>   - Add file_lock comment
>>   - Bring user reset up to date with new reset method
>>
>>   drivers/soc/aspeed/aspeed-xdma.c | 224 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 224 insertions(+)
>>
>> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
>> index a9b3eeb..d4b96a7 100644
>> --- a/drivers/soc/aspeed/aspeed-xdma.c
>> +++ b/drivers/soc/aspeed/aspeed-xdma.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/io.h>
>>   #include <linux/jiffies.h>
>>   #include <linux/mfd/syscon.h>
>> +#include <linux/miscdevice.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of_device.h>
>> @@ -206,6 +207,8 @@ struct aspeed_xdma {
>>   	struct clk *clock;
>>   	struct reset_control *reset;
>>   
>> +	/* file_lock serializes reads of current_client */
>> +	struct mutex file_lock;
>>   	struct aspeed_xdma_client *current_client;
>>   
>>   	/* start_lock protects cmd_idx, cmdq, and the state of the engine */
>> @@ -227,6 +230,8 @@ struct aspeed_xdma {
>>   	dma_addr_t cmdq_vga_phys;
>>   	void *cmdq_vga_virt;
>>   	struct gen_pool *vga_pool;
>> +
>> +	struct miscdevice misc;
>>   };
>>   
>>   struct aspeed_xdma_client {
>> @@ -517,6 +522,207 @@ static irqreturn_t aspeed_xdma_pcie_irq(int irq,
>> void *arg)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
>> +				 size_t len, loff_t *offset)
>> +{
>> +	int rc;
>> +	struct aspeed_xdma_op op;
>> +	struct aspeed_xdma_client *client = file->private_data;
>> +	struct aspeed_xdma *ctx = client->ctx;
>> +	u32 offs = client->phys ? (client->phys - ctx->vga_phys) :
>> +		XDMA_CMDQ_SIZE;
>> +
>> +	if (len != sizeof(op))
>> +		return -EINVAL;
>> +
>> +	rc = copy_from_user(&op, buf, len);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (op.direction == ASPEED_XDMA_DIRECTION_RESET) {
>> +		unsigned long flags;
>> +
>> +		spin_lock_irqsave(&ctx->reset_lock, flags);
>> +		if (ctx->in_reset) {
>> +			spin_unlock_irqrestore(&ctx->reset_lock, flags);
>> +			return len;
>> +		}
>> +
>> +		ctx->in_reset = true;
>> +		spin_unlock_irqrestore(&ctx->reset_lock, flags);
>> +
>> +		mutex_lock(&ctx->start_lock);
>> +
>> +		aspeed_xdma_reset(ctx);
>> +
>> +		mutex_unlock(&ctx->start_lock);
>> +
>> +		return len;
>> +	} else if (op.direction > ASPEED_XDMA_DIRECTION_RESET) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (op.len > ctx->vga_size - offs)
>> +		return -EINVAL;
> I'm wondering if we can rearrange the code to move the sanity checks to the
> top of the function, so this and the `op.direction >
> ASPEED_XDMA_DIRECTION_RESET` case.
>
> The check above should fail for the reset case as well, I expect op.len should
> be set to zero in that case. But I still think that jamming the reset command
> into a "direction" concept feels broken, so as mentioned on an earlier patch
> I'd prefer we move that distraction out to a separate patch.
>
>> +
>> +	if (file->f_flags & O_NONBLOCK) {
>> +		if (!mutex_trylock(&ctx->file_lock))
>> +			return -EAGAIN;
>> +
>> +		if (ctx->current_client) {
>> +			mutex_unlock(&ctx->file_lock);
>> +			return -EAGAIN;
> I think EBUSY is better here.


Sure.


>
>> +		}
>> +	} else {
>> +		mutex_lock(&ctx->file_lock);
>> +
>> +		rc = wait_event_interruptible(ctx->wait, !ctx->current_client);
>> +		if (rc) {
>> +			mutex_unlock(&ctx->file_lock);
>> +			return -EINTR;
>> +		}
>> +	}
>> +
>> +	aspeed_xdma_start(ctx, &op, ctx->vga_phys + offs, client);
>> +
>> +	mutex_unlock(&ctx->file_lock);
> You've used file_lock here to protect aspeed_xdma_start() but start_lock
> above to protect aspeed_xdma_reset(), so it seems one client can disrupt
> another by resetting the engine while a DMA is in progress?


That's correct, that is the intention. In case the transfer hangs, 
another client needs to be able to reset and clear up a blocking transfer.


>
>> +
>> +	if (!(file->f_flags & O_NONBLOCK)) {
>> +		rc = wait_event_interruptible(ctx->wait, !client->in_progress);
>> +		if (rc)
>> +			return -EINTR;
>> +
>> +		if (client->error)
>> +			return -EIO;
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static __poll_t aspeed_xdma_poll(struct file *file,
>> +				 struct poll_table_struct *wait)
>> +{
>> +	__poll_t mask = 0;
>> +	__poll_t req = poll_requested_events(wait);
>> +	struct aspeed_xdma_client *client = file->private_data;
>> +	struct aspeed_xdma *ctx = client->ctx;
>> +
>> +	if (req & (EPOLLIN | EPOLLRDNORM)) {
>> +		if (client->in_progress)
>> +			poll_wait(file, &ctx->wait, wait);
>> +
>> +		if (!client->in_progress) {
>> +			if (client->error)
>> +				mask |= EPOLLERR;
>> +			else
>> +				mask |= EPOLLIN | EPOLLRDNORM;
>> +		}
>> +	}
>> +
>> +	if (req & (EPOLLOUT | EPOLLWRNORM)) {
>> +		if (ctx->current_client)
>> +			poll_wait(file, &ctx->wait, wait);
>> +
>> +		if (!ctx->current_client)
>> +			mask |= EPOLLOUT | EPOLLWRNORM;
>> +	}
>> +
>> +	return mask;
>> +}
>> +
>> +static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
>> +{
>> +	struct aspeed_xdma_client *client = vma->vm_private_data;
>> +
>> +	gen_pool_free(client->ctx->vga_pool, (unsigned long)client->virt,
>> +		      client->size);
> What assurance do we have that a DMA isn't in progress? With non-blocking
> IO we could easily start one then close the file descriptor, which would cause
> havoc if the physical range is reused by a subsequent mapping.


Good point.


>
>> +
>> +	client->virt = NULL;
>> +	client->phys = 0;
>> +	client->size = 0;
>> +}
>> +
>> +static const struct vm_operations_struct aspeed_xdma_vm_ops = {
>> +	.close =	aspeed_xdma_vma_close,
>> +};
>> +
>> +static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
>> +{
>> +	int rc;
>> +	struct aspeed_xdma_client *client = file->private_data;
>> +	struct aspeed_xdma *ctx = client->ctx;
>> +
>> +	/* restrict file to one mapping */
>> +	if (client->size)
>> +		return -ENOMEM;
>> +
>> +	client->size = vma->vm_end - vma->vm_start;
>> +	client->virt = gen_pool_dma_alloc(ctx->vga_pool, client->size,
>> +					  &client->phys);
>> +	if (!client->virt) {
>> +		client->phys = 0;
>> +		client->size = 0;
>> +		return -ENOMEM;
>> +	}
>> +
>> +	vma->vm_pgoff = (client->phys - ctx->vga_phys) >> PAGE_SHIFT;
>> +	vma->vm_ops = &aspeed_xdma_vm_ops;
>> +	vma->vm_private_data = client;
>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +
>> +	rc = io_remap_pfn_range(vma, vma->vm_start, client->phys >> PAGE_SHIFT,
>> +				client->size, vma->vm_page_prot);
>> +	if (rc) {
>> +		gen_pool_free(ctx->vga_pool, (unsigned long)client->virt,
>> +			      client->size);
>> +
>> +		client->virt = NULL;
>> +		client->phys = 0;
>> +		client->size = 0;
>> +		return rc;
>> +	}
>> +
>> +	dev_dbg(ctx->dev, "mmap: v[%08lx] to p[%08x], s[%08x]\n",
>> +		vma->vm_start, (u32)client->phys, client->size);
>> +
>> +	return 0;
>> +}
>> +
>> +static int aspeed_xdma_open(struct inode *inode, struct file *file)
>> +{
>> +	struct miscdevice *misc = file->private_data;
>> +	struct aspeed_xdma *ctx = container_of(misc, struct aspeed_xdma, misc);
>> +	struct aspeed_xdma_client *client = kzalloc(sizeof(*client),
>> +						    GFP_KERNEL);
>> +
>> +	if (!client)
>> +		return -ENOMEM;
>> +
>> +	client->ctx = ctx;
>> +	file->private_data = client;
>> +	return 0;
>> +}
>> +
>> +static int aspeed_xdma_release(struct inode *inode, struct file *file)
>> +{
>> +	struct aspeed_xdma_client *client = file->private_data;
>> +
>> +	if (client->ctx->current_client == client)
>> +		client->ctx->current_client = NULL;
> Shouldn't we also cancel the DMA op? This seems like a DoS risk: set up
> a non-blocking, large downstream transfer then close the client. Also risks
> scribbling on memory we no-longer own given we don't cancel/wait for
> completion in vm close callback?


Right, better wait for completion. There's no way to cancel a transfer.


>
>> +
>> +	kfree(client);
>> +	return 0;
>> +}
>> +
>> +static const struct file_operations aspeed_xdma_fops = {
>> +	.owner			= THIS_MODULE,
>> +	.write			= aspeed_xdma_write,
>> +	.poll			= aspeed_xdma_poll,
>> +	.mmap			= aspeed_xdma_mmap,
>> +	.open			= aspeed_xdma_open,
>> +	.release		= aspeed_xdma_release,
>> +};
>> +
>>   static int aspeed_xdma_probe(struct platform_device *pdev)
>>   {
>>   	int irq;
>> @@ -539,6 +745,7 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
>>   	ctx->chip = md;
>>   	ctx->dev = dev;
>>   	platform_set_drvdata(pdev, ctx);
>> +	mutex_init(&ctx->file_lock);
>>   	mutex_init(&ctx->start_lock);
>>   	INIT_WORK(&ctx->reset_work, aspeed_xdma_reset_work);
>>   	spin_lock_init(&ctx->reset_lock);
>> @@ -678,6 +885,22 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
>>   
>>   	aspeed_xdma_init_eng(ctx);
>>   
>> +	ctx->misc.minor = MISC_DYNAMIC_MINOR;
>> +	ctx->misc.fops = &aspeed_xdma_fops;
>> +	ctx->misc.name = "aspeed-xdma";
>> +	ctx->misc.parent = dev;
>> +	rc = misc_register(&ctx->misc);
>> +	if (rc) {
>> +		dev_err(dev, "Failed to register xdma miscdevice.\n");
>> +
>> +		gen_pool_free(ctx->vga_pool, (unsigned long)ctx->cmdq_vga_virt,
>> +			      XDMA_CMDQ_SIZE);
>> +
>> +		reset_control_assert(ctx->reset);
>> +		clk_disable_unprepare(ctx->clock);
>> +		return rc;
>> +	}
>> +
>>   	/*
>>   	 * This interrupt could fire immediately so only request it once the
>>   	 * engine and driver are initialized.
>> @@ -699,6 +922,7 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
>>   {
>>   	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
>>   
>> +	misc_deregister(&ctx->misc);
>>   	gen_pool_free(ctx->vga_pool, (unsigned long)ctx->cmdq_vga_virt,
>>   		      XDMA_CMDQ_SIZE);
>>   
>> -- 
>> 1.8.3.1
>>
>>
