Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9833C50
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 02:04:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HscP1MCjzDqRJ
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2019 10:04:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amazon.com
 (client-ip=72.21.196.25; helo=smtp-fw-2101.amazon.com;
 envelope-from=prvs=0470dd62b=eduval@amazon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=amazon.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.b="uyD8t4K0"; 
 dkim-atps=neutral
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FVrB2SpXzDqXb
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 13:51:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1559274714; x=1590810714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/zTWh2P/cRaRnaFr2MInWEx70gyKgBh5NgLBbJDnMVM=;
 b=uyD8t4K0/2UWJwD2TbZ11SY1VovR3Ak5SWvWC7RMgjbzKTrD508JsG3x
 O2vUkxNAJLJvyHKDU3j0vcSKINmrIdLPZC6FV2BBF5GR6z3MV+HiIaj7j
 y+SOwBdnPp3fStf/9mGc3V/2vycxurvHzwimlVkr3kqx56QrjHSbVK6KV A=;
X-IronPort-AV: E=Sophos;i="5.60,533,1549929600"; d="scan'208";a="735481853"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 31 May 2019 03:51:49 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6CD5AA232C; Fri, 31 May 2019 03:51:48 +0000 (UTC)
Received: from EX13D15UWA002.ant.amazon.com (10.43.160.218) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 03:51:48 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D15UWA002.ant.amazon.com (10.43.160.218) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 03:51:47 +0000
Received: from localhost (10.85.16.145) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Fri, 31 May 2019 03:51:47 +0000
Date: Thu, 30 May 2019 20:51:47 -0700
From: Eduardo Valentin <eduval@amazon.com>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 3/8] drivers/soc: xdma: Add user interface
Message-ID: <20190531035147.GI17772@u40b0340c692b58f6553c.ant.amazon.com>
References: <1559153408-31190-1-git-send-email-eajames@linux.ibm.com>
 <1559153408-31190-4-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1559153408-31190-4-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: Bulk
X-Mailman-Approved-At: Tue, 04 Jun 2019 10:04:00 +1000
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2019 at 01:10:03PM -0500, Eddie James wrote:
> This commits adds a miscdevice to provide a user interface to the XDMA
> engine. The interface provides the write operation to start DMA
> operations. The DMA parameters are passed as the data to the write call.
> The actual data to transfer is NOT passed through write. Note that both
> directions of DMA operation are accomplished through the write command;
> BMC to host and host to BMC.
> 
> The XDMA engine is restricted to only accessing the reserved memory
> space on the AST2500, typically used by the VGA. For this reason, the
> VGA memory space is pooled and allocated with genalloc. Users calling
> mmap allocate pages from this pool for their usage. The space allocated
> by a client will be the space used in the DMA operation. For an
> "upstream" (BMC to host) operation, the data in the client's area will
> be transferred to the host. For a "downstream" (host to BMC) operation,
> the host data will be placed in the client's memory area.
> 
> Poll is also provided in order to determine when the DMA operation is
> complete for non-blocking IO.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 201 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 201 insertions(+)
> 
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
> index 3dc0ce4..39f6545 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -129,6 +129,8 @@ struct aspeed_xdma {
>  
>  	unsigned long flags;
>  	unsigned int cmd_idx;
> +	struct mutex list_lock;
> +	struct mutex start_lock;
>  	wait_queue_head_t wait;
>  	struct aspeed_xdma_client *current_client;
>  
> @@ -140,6 +142,8 @@ struct aspeed_xdma {
>  	dma_addr_t cmdq_vga_phys;
>  	void *cmdq_vga_virt;
>  	struct gen_pool *vga_pool;
> +
> +	struct miscdevice misc;
>  };
>  
>  struct aspeed_xdma_client {
> @@ -331,6 +335,183 @@ static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
> +				 size_t len, loff_t *offset)
> +{
> +	int rc;
> +	struct aspeed_xdma_op op;
> +	struct aspeed_xdma_client *client = file->private_data;
> +	struct aspeed_xdma *ctx = client->ctx;
> +	u32 offs = client->phys ? (client->phys - ctx->vga_phys) :
> +		XDMA_CMDQ_SIZE;
> +
> +	if (len != sizeof(struct aspeed_xdma_op))
> +		return -EINVAL;
> +
> +	rc = copy_from_user(&op, buf, len);
> +	if (rc)
> +		return rc;
> +
> +	if (op.len > (ctx->vga_size - offs) || op.len < XDMA_BYTE_ALIGN)
> +		return -EINVAL;
> +
> +	if (file->f_flags & O_NONBLOCK) {
> +		if (!mutex_trylock(&ctx->start_lock))
> +			return -EAGAIN;
> +
> +		if (test_bit(XDMA_IN_PRG, &ctx->flags)) {
> +			mutex_unlock(&ctx->start_lock);
> +			return -EAGAIN;
> +		}
> +	} else {
> +		mutex_lock(&ctx->start_lock);
> +
> +		rc = wait_event_interruptible(ctx->wait,
> +					      !test_bit(XDMA_IN_PRG,
> +							&ctx->flags));
> +		if (rc) {
> +			mutex_unlock(&ctx->start_lock);
> +			return -EINTR;
> +		}
> +	}
> +
> +	ctx->current_client = client;
> +	set_bit(XDMA_IN_PRG, &client->flags);
> +
> +	aspeed_xdma_start(ctx, &op, ctx->vga_phys + offs);
> +
> +	mutex_unlock(&ctx->start_lock);
> +
> +	if (!(file->f_flags & O_NONBLOCK)) {
> +		rc = wait_event_interruptible(ctx->wait,
> +					      !test_bit(XDMA_IN_PRG,
> +							&ctx->flags));
> +		if (rc)
> +			return -EINTR;
> +	}
> +
> +	return len;
> +}
> +
> +static __poll_t aspeed_xdma_poll(struct file *file,
> +				 struct poll_table_struct *wait)
> +{
> +	__poll_t mask = 0;
> +	__poll_t req = poll_requested_events(wait);
> +	struct aspeed_xdma_client *client = file->private_data;
> +	struct aspeed_xdma *ctx = client->ctx;
> +
> +	if (req & (EPOLLIN | EPOLLRDNORM)) {
> +		if (test_bit(XDMA_IN_PRG, &client->flags))
> +			poll_wait(file, &ctx->wait, wait);
> +
> +		if (!test_bit(XDMA_IN_PRG, &client->flags))
> +			mask |= EPOLLIN | EPOLLRDNORM;
> +	}
> +
> +	if (req & (EPOLLOUT | EPOLLWRNORM)) {
> +		if (test_bit(XDMA_IN_PRG, &ctx->flags))
> +			poll_wait(file, &ctx->wait, wait);
> +
> +		if (!test_bit(XDMA_IN_PRG, &ctx->flags))
> +			mask |= EPOLLOUT | EPOLLWRNORM;
> +	}
> +
> +	return mask;
> +}
> +
> +static void aspeed_xdma_vma_close(struct vm_area_struct *vma)
> +{
> +	struct aspeed_xdma_client *client = vma->vm_private_data;
> +
> +	gen_pool_free(client->ctx->vga_pool, (unsigned long)client->virt,
> +		      client->size);
> +
> +	client->virt = NULL;
> +	client->phys = 0;
> +	client->size = 0;
> +}
> +
> +static const struct vm_operations_struct aspeed_xdma_vm_ops = {
> +	.close =	aspeed_xdma_vma_close,
> +};
> +
> +static int aspeed_xdma_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	int rc;
> +	struct aspeed_xdma_client *client = file->private_data;
> +	struct aspeed_xdma *ctx = client->ctx;
> +
> +	/* restrict file to one mapping */
> +	if (client->size)
> +		return -ENOMEM;
> +
> +	client->size = vma->vm_end - vma->vm_start;
> +	client->virt = gen_pool_dma_alloc(ctx->vga_pool, client->size,
> +					  &client->phys);
> +	if (!client->virt) {
> +		client->phys = 0;
> +		client->size = 0;
> +		return -ENOMEM;
> +	}
> +
> +	vma->vm_pgoff = (client->phys - ctx->vga_phys) >> PAGE_SHIFT;
> +	vma->vm_ops = &aspeed_xdma_vm_ops;
> +	vma->vm_private_data = client;
> +
> +	rc = dma_mmap_coherent(ctx->dev, vma, ctx->vga_virt, ctx->vga_dma,
> +			       ctx->vga_size);
> +	if (rc) {
> +		gen_pool_free(ctx->vga_pool, (unsigned long)client->virt,
> +			      client->size);
> +
> +		client->virt = NULL;
> +		client->phys = 0;
> +		client->size = 0;
> +		return rc;
> +	}
> +
> +	dev_dbg(ctx->dev, "mmap: v[%08lx] to p[%08x], s[%08x]\n",
> +		vma->vm_start, (u32)client->phys, client->size);
> +
> +	return 0;
> +}
> +
> +static int aspeed_xdma_open(struct inode *inode, struct file *file)
> +{
> +	struct miscdevice *misc = file->private_data;
> +	struct aspeed_xdma *ctx = container_of(misc, struct aspeed_xdma, misc);
> +	struct aspeed_xdma_client *client = kzalloc(sizeof(*client),
> +						    GFP_KERNEL);
> +
> +	if (!client)
> +		return -ENOMEM;
> +
> +	client->ctx = ctx;
> +	file->private_data = client;
> +	return 0;
> +}
> +
> +static int aspeed_xdma_release(struct inode *inode, struct file *file)
> +{
> +	struct aspeed_xdma_client *client = file->private_data;
> +
> +	if (client->ctx->current_client == client)
> +		client->ctx->current_client = NULL;
> +
> +	kfree(client);
> +	return 0;
> +}
> +
> +static const struct file_operations aspeed_xdma_fops = {
> +	.owner			= THIS_MODULE,
> +	.write			= aspeed_xdma_write,
> +	.poll			= aspeed_xdma_poll,
> +	.mmap			= aspeed_xdma_mmap,
> +	.open			= aspeed_xdma_open,
> +	.release		= aspeed_xdma_release,
> +};
> +
>  static int aspeed_xdma_init_mem(struct aspeed_xdma *ctx)
>  {
>  	int rc;
> @@ -431,6 +612,8 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
>  	ctx->dev = dev;
>  	platform_set_drvdata(pdev, ctx);
>  	init_waitqueue_head(&ctx->wait);
> +	mutex_init(&ctx->list_lock);
> +	mutex_init(&ctx->start_lock);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ctx->base = devm_ioremap_resource(dev, res);
> @@ -482,6 +665,23 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
>  
>  	aspeed_xdma_init_eng(ctx);
>  
> +	ctx->misc.minor = MISC_DYNAMIC_MINOR;
> +	ctx->misc.fops = &aspeed_xdma_fops;
> +	ctx->misc.name = "xdma";

tiny bit here, should this be named more specific ? something like "aspeed_xdma" ?

> +	ctx->misc.parent = dev;
> +	rc = misc_register(&ctx->misc);
> +	if (rc) {
> +		dev_err(dev, "Unable to register xdma miscdevice.\n");
> +
> +		gen_pool_free(ctx->vga_pool, (unsigned long)ctx->cmdq_vga_virt,
> +			      XDMA_CMDQ_SIZE);
> +		dma_free_coherent(dev, ctx->vga_size, ctx->vga_virt,
> +				  ctx->vga_dma);
> +		dma_release_declared_memory(dev);
> +		reset_control_assert(ctx->reset);
> +		return rc;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -489,6 +689,7 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
>  {
>  	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
>  
> +	misc_deregister(&ctx->misc);
>  	gen_pool_free(ctx->vga_pool, (unsigned long)ctx->cmdq_vga_virt,
>  		      XDMA_CMDQ_SIZE);
>  	dma_free_coherent(ctx->dev, ctx->vga_size, ctx->vga_virt,
> -- 
> 1.8.3.1
> 

-- 
All the best,
Eduardo Valentin
