Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93B4BD86E
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 10:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Gj511FRz3cBN
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Feb 2022 20:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Cczgnc3h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Cczgnc3h; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Gj110xpz30H3;
 Mon, 21 Feb 2022 20:09:55 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id c14so30455537qvl.12;
 Mon, 21 Feb 2022 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t6EQDaBYYRWCb4oKT3vUObC3Be0bsFP7kZxVaalF3tc=;
 b=Cczgnc3hB0XtCzfgl7LdCO6WUTg9u2Fsi9YsLmQEJB899o45iwZ4tZwnEQcbietqoC
 e/2+bGj0AovnQ4uDXMONdl/ODnzegfoDjW7/BVnikZPjb4gy62+wQapqK3oZMeYKI5qN
 6Tz7eMuSQG/xcbFcEQGzFOIoyPrl5Q/fV25t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t6EQDaBYYRWCb4oKT3vUObC3Be0bsFP7kZxVaalF3tc=;
 b=IIjIOLcOxtoxAumXjy4zUcHn04tOZ8rlOOs9BW/nxO2aB+9rJGSAG8GfmcC8m5tmBK
 zecxjWLYtsDHfMABFeCy134hHxmPFP8QwvylKK/i+ZExFmht9VgnvqT/JVoTaS7BL/tn
 oqdRET0WBC4Svi6Y1GepCFpD/HokfWGxv/0JS1s9adlaAiJVA0sHOa/cHixotsdai+iL
 D6uub4nOSvHSAn+hGhY3QyqaB+OCVJxoOQNbDGqJBp4okJYY/BFhKJTGEl2MiiDB5Cg3
 tdXdWQX2yQoH986AUXQmAdFsx/cbtIrW0VDU/c1yd5KgdLpbCGmNAXMPsMKBE3RpEjt7
 EkUQ==
X-Gm-Message-State: AOAM5326p8bwoUh1mmVu1vHAYIFcixOiCmHxJbG4OjJotCfzTtovH9oT
 eBzABfFcny/eoADGW90C+3XOsLhFVDscBBM2w8c=
X-Google-Smtp-Source: ABdhPJwNfRrnlsfOC2RtSKZjqfK6d/2Zwn+FNsucSttU93RuMNvEAh9qxL07IhQwvjKDaqbtTvVWeo2SbpF+FCS+VI8=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr16559597qtb.678.1645434593594; Mon, 21
 Feb 2022 01:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20220207161640.35605-1-eajames@linux.ibm.com>
In-Reply-To: <20220207161640.35605-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Feb 2022 09:09:40 +0000
Message-ID: <CACPK8XeGyGdVw-KzdCXD_JAL3Qymp_hY-v4pqP9GtxjpQ7G5rw@mail.gmail.com>
Subject: Re: [PATCH] fsi: Add trace events in initialization path
To: Eddie James <eajames@linux.ibm.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 7 Feb 2022 at 16:17, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add definitions for trace events to show the scanning flow.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Thanks Eddie. I've applied this with Steven's r-b.

> ---
>  drivers/fsi/fsi-core.c                   | 11 ++-
>  drivers/fsi/fsi-master-aspeed.c          |  2 +
>  include/trace/events/fsi.h               | 86 ++++++++++++++++++++++++
>  include/trace/events/fsi_master_aspeed.h | 12 ++++
>  4 files changed, 108 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 59ddc9fd5bca..3a7b78e36701 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -24,9 +24,6 @@
>
>  #include "fsi-master.h"
>
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/fsi.h>
> -
>  #define FSI_SLAVE_CONF_NEXT_MASK       GENMASK(31, 31)
>  #define FSI_SLAVE_CONF_SLOTS_MASK      GENMASK(23, 16)
>  #define FSI_SLAVE_CONF_SLOTS_SHIFT     16
> @@ -95,6 +92,9 @@ struct fsi_slave {
>         u8                      t_echo_delay;
>  };
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/fsi.h>
> +
>  #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
>  #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>
> @@ -524,6 +524,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>                         dev->addr = engine_addr;
>                         dev->size = slots * engine_page_size;
>
> +                       trace_fsi_dev_init(dev);
> +
>                         dev_dbg(&slave->dev,
>                         "engine[%i]: type %x, version %x, addr %x size %x\n",
>                                         dev->unit, dev->engine_type, version,
> @@ -1006,6 +1008,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>
>         crc = crc4(0, cfam_id, 32);
>         if (crc) {
> +               trace_fsi_slave_invalid_cfam(master, link, cfam_id);
>                 dev_warn(&master->dev, "slave %02x:%02x invalid cfam id CRC!\n",
>                                 link, id);
>                 return -EIO;
> @@ -1080,6 +1083,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>         if (rc)
>                 goto err_free;
>
> +       trace_fsi_slave_init(slave);
> +
>         /* Create chardev for userspace access */
>         cdev_init(&slave->cdev, &cfam_fops);
>         rc = cdev_device_add(&slave->cdev, &slave->dev);
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 0bed2fab8055..7cec1772820d 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -449,11 +449,13 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
>  {
>         struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
>
> +       trace_fsi_master_aspeed_cfam_reset(true);
>         mutex_lock(&aspeed->lock);
>         gpiod_set_value(aspeed->cfam_reset_gpio, 1);
>         usleep_range(900, 1000);
>         gpiod_set_value(aspeed->cfam_reset_gpio, 0);
>         mutex_unlock(&aspeed->lock);
> +       trace_fsi_master_aspeed_cfam_reset(false);
>
>         return count;
>  }
> diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
> index 9832cb8e0eb0..c9a72e8432b8 100644
> --- a/include/trace/events/fsi.h
> +++ b/include/trace/events/fsi.h
> @@ -122,6 +122,92 @@ TRACE_EVENT(fsi_master_break,
>         )
>  );
>
> +TRACE_EVENT(fsi_slave_init,
> +       TP_PROTO(const struct fsi_slave *slave),
> +       TP_ARGS(slave),
> +       TP_STRUCT__entry(
> +               __field(int,    master_idx)
> +               __field(int,    master_n_links)
> +               __field(int,    idx)
> +               __field(int,    link)
> +               __field(int,    chip_id)
> +               __field(__u32,  cfam_id)
> +               __field(__u32,  size)
> +       ),
> +       TP_fast_assign(
> +               __entry->master_idx = slave->master->idx;
> +               __entry->master_n_links = slave->master->n_links;
> +               __entry->idx = slave->cdev_idx;
> +               __entry->link = slave->link;
> +               __entry->chip_id = slave->chip_id;
> +               __entry->cfam_id = slave->cfam_id;
> +               __entry->size = slave->size;
> +       ),
> +       TP_printk("fsi%d: idx:%d link:%d/%d cid:%d cfam:%08x %08x",
> +               __entry->master_idx,
> +               __entry->idx,
> +               __entry->link,
> +               __entry->master_n_links,
> +               __entry->chip_id,
> +               __entry->cfam_id,
> +               __entry->size
> +       )
> +);
> +
> +TRACE_EVENT(fsi_slave_invalid_cfam,
> +       TP_PROTO(const struct fsi_master *master, int link, uint32_t cfam_id),
> +       TP_ARGS(master, link, cfam_id),
> +       TP_STRUCT__entry(
> +               __field(int,    master_idx)
> +               __field(int,    master_n_links)
> +               __field(int,    link)
> +               __field(__u32,  cfam_id)
> +       ),
> +       TP_fast_assign(
> +               __entry->master_idx = master->idx;
> +               __entry->master_n_links = master->n_links;
> +               __entry->link = link;
> +               __entry->cfam_id = cfam_id;
> +       ),
> +       TP_printk("fsi%d: cfam:%08x link:%d/%d",
> +               __entry->master_idx,
> +               __entry->cfam_id,
> +               __entry->link,
> +               __entry->master_n_links
> +       )
> +);
> +
> +TRACE_EVENT(fsi_dev_init,
> +       TP_PROTO(const struct fsi_device *dev),
> +       TP_ARGS(dev),
> +       TP_STRUCT__entry(
> +               __field(int,    master_idx)
> +               __field(int,    link)
> +               __field(int,    type)
> +               __field(int,    unit)
> +               __field(int,    version)
> +               __field(__u32,  addr)
> +               __field(__u32,  size)
> +       ),
> +       TP_fast_assign(
> +               __entry->master_idx = dev->slave->master->idx;
> +               __entry->link = dev->slave->link;
> +               __entry->type = dev->engine_type;
> +               __entry->unit = dev->unit;
> +               __entry->version = dev->version;
> +               __entry->addr = dev->addr;
> +               __entry->size = dev->size;
> +       ),
> +       TP_printk("fsi%d: slv%d: t:%02x u:%02x v:%02x %08x@%08x",
> +               __entry->master_idx,
> +               __entry->link,
> +               __entry->type,
> +               __entry->unit,
> +               __entry->version,
> +               __entry->size,
> +               __entry->addr
> +       )
> +);
>
>  #endif /* _TRACE_FSI_H */
>
> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
> index a355ceacc33f..0fff873775f1 100644
> --- a/include/trace/events/fsi_master_aspeed.h
> +++ b/include/trace/events/fsi_master_aspeed.h
> @@ -72,6 +72,18 @@ TRACE_EVENT(fsi_master_aspeed_opb_error,
>                 )
>         );
>
> +TRACE_EVENT(fsi_master_aspeed_cfam_reset,
> +       TP_PROTO(bool start),
> +       TP_ARGS(start),
> +       TP_STRUCT__entry(
> +               __field(bool,   start)
> +       ),
> +       TP_fast_assign(
> +               __entry->start = start;
> +       ),
> +       TP_printk("%s", __entry->start ? "start" : "end")
> +);
> +
>  #endif
>
>  #include <trace/define_trace.h>
> --
> 2.27.0
>
