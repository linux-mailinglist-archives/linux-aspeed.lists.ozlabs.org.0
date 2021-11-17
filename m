Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18C453F3F
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 05:10:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv8bM6lVzz2yQw
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 15:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MVUenwOc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MVUenwOc; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv8bH3vrJz2yHq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 15:10:01 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id d2so1185411qki.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 20:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HxVTZxtZquz4x3u5Kq8UkO0yjTH9Q2w5eX8LuUUsoE8=;
 b=MVUenwOcceN0XLJb1Byv2qqu7fP7xYJpowfJJW1y0YlDP8t8Dp7T7LolfToW8JbdoS
 fhx7vV9FwyYM3mwu4DJnB5Z6QKBuhnZs7sQFk8NlTQWndabgH+LUAWNkDS32tNCOqCTH
 yiEmy742LX7hvyJzhuLjkTXClTRKCP1Kb/LLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HxVTZxtZquz4x3u5Kq8UkO0yjTH9Q2w5eX8LuUUsoE8=;
 b=nBq64SeLNq3ZGGzX++V75T4WJ/jcMhcLKd5nUji5uQLnaadi6+7xen5vV6pb5r8rxZ
 2eRoOT23HlgnnhW2NfruxKX8AG/Dqzy8A8MXEvIHdH/VDkf6eiAlwsGM9sJkmXmf+vGi
 +VNGbFiNHuDNI28zttbf0KrswQ07MrdJFuxeh7XXRb0cx2LeAz2JA6Fv3+uT967x7pxi
 rMh3n1tKHIND0auI4TkIz28GUKSdbw+yKXAYVGedJiXRh4UG6lYsnple2HLMWmOLnHx/
 VkfC0K6SgP+ntkgT2i6qwrh/Ef8JxuG03PLfsRULTcHvaaNrMolhycsgLO7+jYgiD7Za
 DDlQ==
X-Gm-Message-State: AOAM533Z9U/4mEyTw9PolihEheqo+ldGeOfavun+sqxNsONTd8s5Xlmz
 W6pzAm63f+7MIcVvwxWx5PVSr7iqYd8zbKdGEy0=
X-Google-Smtp-Source: ABdhPJwK8cohubH1skRrn5h5GOVs79g9HktvNlyKFsLE57BDWq/9/uzbxsHQOvUoKtMPGfPYkFH79ZXNqWTUMTy6u+I=
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr10669039qkp.381.1637122196217; 
 Tue, 16 Nov 2021 20:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20210224090620.25419-1-govert.overgaauw@prodrive-technologies.com>
In-Reply-To: <20210224090620.25419-1-govert.overgaauw@prodrive-technologies.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 04:09:44 +0000
Message-ID: <CACPK8XdLMVzRiYsfH9EUfcVcKR_4AyxVHR8qGs1hxYSsJXa41g@mail.gmail.com>
Subject: Re: [PATCH] aspeed-lpc-snoop: add 16-bit POST code support
To: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>, 
 Zev Weiss <zweiss@equinix.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Oskar Senft <osk@google.com>, Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stef van Os <stef.van.os@prodrive-technologies.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Govert,

On Wed, 24 Feb 2021 at 09:07, Govert Overgaauw
<govert.overgaauw@prodrive-technologies.com> wrote:
>
> Intel coffeelake plattform uses a 16-bit POST code format instead of 8-bit. Add
> a third FIFO for storing the combined 16-bit post codes.

Thanks for the patch. It slipped through the cracks. I would like to
merge it if we could get some review and/or testing.

Ryan, Zev, Oskar, Lei: please jump in if you're able to help.

Cheers,

Joel

>
> Signed-off-by: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 117 +++++++++++++++++---------
>  1 file changed, 79 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 682ba0eb4eba..40d113d253fc 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -58,7 +58,7 @@ struct aspeed_lpc_snoop_model_data {
>         unsigned int has_hicrb_ensnp;
>  };
>
> -struct aspeed_lpc_snoop_channel {
> +struct aspeed_lpc_snoop_fifo {
>         struct kfifo            fifo;
>         wait_queue_head_t       wq;
>         struct miscdevice       miscdev;
> @@ -67,32 +67,39 @@ struct aspeed_lpc_snoop_channel {
>  struct aspeed_lpc_snoop {
>         struct regmap           *regmap;
>         int                     irq;
> -       struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
> +       struct aspeed_lpc_snoop_fifo chan[NUM_SNOOP_CHANNELS];
> +
> +       /*
> +        * 16-bit postcodes are combination
> +        * of both channels written to a seperate device file, because
> +        * both bytes have to be added on the same interrupt.
> +        */
> +       struct aspeed_lpc_snoop_fifo combined;
>  };
>
> -static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
> +static struct aspeed_lpc_snoop_fifo *snoop_file_to_fifo(struct file *file)
>  {
>         return container_of(file->private_data,
> -                           struct aspeed_lpc_snoop_channel,
> +                           struct aspeed_lpc_snoop_fifo,
>                             miscdev);
>  }
>
>  static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>                                 size_t count, loff_t *ppos)
>  {
> -       struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
> +       struct aspeed_lpc_snoop_fifo *fifo = snoop_file_to_fifo(file);
>         unsigned int copied;
>         int ret = 0;
>
> -       if (kfifo_is_empty(&chan->fifo)) {
> +       if (kfifo_is_empty(&fifo->fifo)) {
>                 if (file->f_flags & O_NONBLOCK)
>                         return -EAGAIN;
> -               ret = wait_event_interruptible(chan->wq,
> -                               !kfifo_is_empty(&chan->fifo));
> +               ret = wait_event_interruptible(fifo->wq,
> +                               !kfifo_is_empty(&fifo->fifo));
>                 if (ret == -ERESTARTSYS)
>                         return -EINTR;
>         }
> -       ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +       ret = kfifo_to_user(&fifo->fifo, buffer, count, &copied);
>
>         return ret ? ret : copied;
>  }
> @@ -100,10 +107,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>  static __poll_t snoop_file_poll(struct file *file,
>                                     struct poll_table_struct *pt)
>  {
> -       struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
> +       struct aspeed_lpc_snoop_fifo *fifo = snoop_file_to_fifo(file);
>
> -       poll_wait(file, &chan->wq, pt);
> -       return !kfifo_is_empty(&chan->fifo) ? EPOLLIN : 0;
> +       poll_wait(file, &fifo->wq, pt);
> +       return !kfifo_is_empty(&fifo->fifo) ? EPOLLIN : 0;
>  }
>
>  static const struct file_operations snoop_fops = {
> @@ -113,21 +120,22 @@ static const struct file_operations snoop_fops = {
>         .llseek = noop_llseek,
>  };
>
> -/* Save a byte to a FIFO and discard the oldest byte if FIFO is full */
> -static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
> +/* Save data to a FIFO and discard the oldest byte if FIFO is full */
> +static void put_fifo_with_discard(struct aspeed_lpc_snoop_fifo *fifo, size_t len, u8 *buf)
>  {
> -       if (!kfifo_initialized(&chan->fifo))
> +       if (!kfifo_initialized(&fifo->fifo))
>                 return;
> -       if (kfifo_is_full(&chan->fifo))
> -               kfifo_skip(&chan->fifo);
> -       kfifo_put(&chan->fifo, val);
> -       wake_up_interruptible(&chan->wq);
> +       if (kfifo_is_full(&fifo->fifo))
> +               kfifo_skip(&fifo->fifo);
> +       kfifo_in(&fifo->fifo, buf, len);
> +       wake_up_interruptible(&fifo->wq);
>  }
>
>  static irqreturn_t aspeed_lpc_snoop_irq(int irq, void *arg)
>  {
>         struct aspeed_lpc_snoop *lpc_snoop = arg;
>         u32 reg, data;
> +       u16 postval = 0;
>
>         if (regmap_read(lpc_snoop->regmap, HICR6, &reg))
>                 return IRQ_NONE;
> @@ -140,20 +148,25 @@ static irqreturn_t aspeed_lpc_snoop_irq(int irq, void *arg)
>         /* Ack pending IRQs */
>         regmap_write(lpc_snoop->regmap, HICR6, reg);
>
> -       /* Read and save most recent snoop'ed data byte to FIFO */
> +       /* Read and save most recent snoop'ed data byte(s) to FIFO */
>         regmap_read(lpc_snoop->regmap, SNPWDR, &data);
>
>         if (reg & HICR6_STR_SNP0W) {
>                 u8 val = (data & SNPWDR_CH0_MASK) >> SNPWDR_CH0_SHIFT;
>
> -               put_fifo_with_discard(&lpc_snoop->chan[0], val);
> +               put_fifo_with_discard(&lpc_snoop->chan[0], sizeof(val), &val);
> +               postval |= val;
>         }
>         if (reg & HICR6_STR_SNP1W) {
>                 u8 val = (data & SNPWDR_CH1_MASK) >> SNPWDR_CH1_SHIFT;
>
> -               put_fifo_with_discard(&lpc_snoop->chan[1], val);
> +               put_fifo_with_discard(&lpc_snoop->chan[1], sizeof(val), &val);
> +               postval |= (val << 8);
>         }
>
> +       if (postval)
> +               put_fifo_with_discard(&lpc_snoop->combined, sizeof(postval), (u8 *)&postval);
> +
>         return IRQ_HANDLED;
>  }
>
> @@ -179,6 +192,34 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
>         return 0;
>  }
>
> +static int aspeed_lpc_create_fifo_chardev(struct aspeed_lpc_snoop_fifo *fifo,
> +       struct device *dev, int devnum)
> +{
> +       int rc = 0;
> +
> +       init_waitqueue_head(&fifo->wq);
> +       /* Create FIFO datastructure */
> +       rc = kfifo_alloc(&fifo->fifo,
> +                        SNOOP_FIFO_SIZE, GFP_KERNEL);
> +       if (rc)
> +               return rc;
> +
> +       fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       fifo->miscdev.name =
> +               devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, devnum);
> +       fifo->miscdev.fops = &snoop_fops;
> +       fifo->miscdev.parent = dev;
> +
> +       return misc_register(&fifo->miscdev);
> +}
> +
> +static void aspeed_lpc_destroy_fifo_chardev(struct aspeed_lpc_snoop_fifo *fifo)
> +{
> +
> +       kfifo_free(&fifo->fifo);
> +       misc_deregister(&fifo->miscdev);
> +}
> +
>  static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>                                    struct device *dev,
>                                    int channel, u16 lpc_port)
> @@ -188,19 +229,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>         const struct aspeed_lpc_snoop_model_data *model_data =
>                 of_device_get_match_data(dev);
>
> -       init_waitqueue_head(&lpc_snoop->chan[channel].wq);
> -       /* Create FIFO datastructure */
> -       rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
> -                        SNOOP_FIFO_SIZE, GFP_KERNEL);
> -       if (rc)
> -               return rc;
> -
> -       lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
> -       lpc_snoop->chan[channel].miscdev.name =
> -               devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
> -       lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
> -       lpc_snoop->chan[channel].miscdev.parent = dev;
> -       rc = misc_register(&lpc_snoop->chan[channel].miscdev);
> +       rc = aspeed_lpc_create_fifo_chardev(&lpc_snoop->chan[channel],
> +               dev, channel);
>         if (rc)
>                 return rc;
>
> @@ -250,8 +280,7 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>                 return;
>         }
>
> -       kfifo_free(&lpc_snoop->chan[channel].fifo);
> -       misc_deregister(&lpc_snoop->chan[channel].miscdev);
> +       aspeed_lpc_destroy_fifo_chardev(&lpc_snoop->chan[channel]);
>  }
>
>  static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
> @@ -295,9 +324,18 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
>                                        1, &port) == 0) {
>                 rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
>                 if (rc)
> -                       aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +                       goto err_port1;
> +
> +               rc = aspeed_lpc_create_fifo_chardev(&lpc_snoop->combined, dev, 2);
> +               if (rc)
> +                       goto err_combined;
>         }
>
> +       return rc;
> +err_combined:
> +       aspeed_lpc_disable_snoop(lpc_snoop, 1);
> +err_port1:
> +       aspeed_lpc_disable_snoop(lpc_snoop, 0);
>         return rc;
>  }
>
> @@ -309,6 +347,9 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>         aspeed_lpc_disable_snoop(lpc_snoop, 0);
>         aspeed_lpc_disable_snoop(lpc_snoop, 1);
>
> +       /* disable combined fifo device */
> +       aspeed_lpc_destroy_fifo_chardev(&lpc_snoop->combined);
> +
>         return 0;
>  }
>
> --
> 2.20.1
>
