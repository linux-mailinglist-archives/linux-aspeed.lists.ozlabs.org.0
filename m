Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4E2D2726
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 10:07:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqvTD2FKpzDqWT
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 20:07:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=T6Fjrn5S; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqvSx4GgdzDqSq
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 20:07:10 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id d8so7303966otq.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Dec 2020 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suhAyysHILS0z9ssFgeQI7iHnc5/D57Rmf1ZLjPLHMo=;
 b=T6Fjrn5SyumfCtz7MO8j8oVgjzCFJKzm56NTSu92/Sgkvl6ufgWd1zmcSukSBzovSz
 kLeDi8dnZEYS3Dllrm88BofLw9Z4+H/V4dA5+kYXO/OO9ilHVpf2trVogsBqQpfDvHw6
 tN3AgbX4tJuPCFLa7adCkzppDjFNGC6tQP5MdYCOPIuo296lNpH9XWfupv/rwypWKuv+
 setWDltoxYA2fvZnWpMRKMwYG5vn4gHh72zx+Nc2yohUkKor3cSayJWH4oF9VoXzZsWl
 bKROQX8Jpa/osFb67JfmZpJFxnGPkjg+JC55saVb9ocBbjQZukBolqPv+i3ARs5bVu9S
 oTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suhAyysHILS0z9ssFgeQI7iHnc5/D57Rmf1ZLjPLHMo=;
 b=U6zLW/m6JWKiGKJFqfcK/autJUpFH7E0UMKNn1g3Wa9xb+panskvhW0DEQDJ3p0Sdl
 tQiYJTA1mR4AogcAQfWiQSITNNxXLwBroO1uglAXambNNSTX30Be36uRsO6jc+1KQuOc
 5awZFi2gYxtTUrZ4bIPjpXk8/jcyGQ8LXjyQ4pL4fwIqBHQog1efGWNDz6Il0bs4RDVW
 4kmzNVfIFTQiftYI9Q0dKiWSzVcuKrKDpBFzIeIfPC7fVk/vpCmNNNogBIasFUUzXZza
 AkD2LCfRhzFFnlUl+oZMnfM46zlaU222TWY8ShfU0fXW8ePJVHAKALa6x05aZtMyKM5A
 vidg==
X-Gm-Message-State: AOAM530TAxrPN1MritwiifLnH6zxIGpGq5Gp+DcpLxQZM2aK4A87SSml
 65y1+Xp2FASIr2lBT77dHk7pSd19B1D3EB21W8bvqQ==
X-Google-Smtp-Source: ABdhPJyIUdXikWlknUrS+S8RFcek3mph9DWrqyVoswvRQQWw0XOuc4RUBGK5SWInd3Y22+Kfm75aEiECjrcjRLCkhLQ=
X-Received: by 2002:a9d:3dc3:: with SMTP id l61mr15794847otc.140.1607418426544; 
 Tue, 08 Dec 2020 01:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
 <CACPK8Xf317mv_q96b7L2ohswkoiRrGDMdqs_zSCyBux99XjHEw@mail.gmail.com>
In-Reply-To: <CACPK8Xf317mv_q96b7L2ohswkoiRrGDMdqs_zSCyBux99XjHEw@mail.gmail.com>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Tue, 8 Dec 2020 17:06:55 +0800
Message-ID: <CAH0XSJuWtuO+NCw_QuU8L6t2FwTEpYmBS0h=FC6fk-2JH63r-g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] misc: Add clock control logic into
 Aspeed LPC SNOOP driver
To: Joel Stanley <joel@jms.id.au>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Lotus Xu <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 8, 2020 at 10:19 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 2 Dec 2020 at 05:16, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> >
> > If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
> > SNOOP block will be enabled without heart beating of LCLK until
> > lpc-ctrl enables the LCLK. This issue causes improper handling on
> > host interrupts when the host sends interrupt in that time frame.
> > Then kernel eventually forcibly disables the interrupt with
> > dumping stack and printing a 'nobody cared this irq' message out.
> >
> > To prevent this issue, all LPC sub-nodes should enable LCLK
> > individually so this patch adds clock control logic into the LPC
> > SNOOP driver.
> >
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> > Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Thanks for sending these John. It is an excellent idea to upstream
> fixes that have been developed.
>
> I assume we will have the same issue for all devices that use the LPC
> bus? eg. vuart, bt, kcs, lpc2ahb? It looks like only the lpc-ctrl
> (lpc2ahb) does this so far:

ok that's on my todo list.  :)

>
> git grep -l clk drivers/soc/aspeed/aspeed-p2a-ctrl.c
> drivers/soc/aspeed/aspeed-lpc-ctrl.c
> drivers/char/ipmi/kcs_bmc_aspeed.c drivers/char/ipmi/bt-bmc.c
> drivers/soc/aspeed/aspeed-lpc-ctrl.c
>
>
>
>
> > ---
> >  drivers/soc/aspeed/aspeed-lpc-snoop.c | 30 ++++++++++++++++++++++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > index 682ba0eb4eba..20acac6342ef 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -11,6 +11,7 @@
> >   */
> >
> >  #include <linux/bitops.h>
> > +#include <linux/clk.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/fs.h>
> >  #include <linux/kfifo.h>
> > @@ -67,6 +68,7 @@ struct aspeed_lpc_snoop_channel {
> >  struct aspeed_lpc_snoop {
> >         struct regmap           *regmap;
> >         int                     irq;
> > +       struct clk              *clk;
> >         struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
> >  };
> >
> > @@ -282,22 +284,42 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
> >                 return -ENODEV;
> >         }
> >
> > +       lpc_snoop->clk = devm_clk_get(dev, NULL);
> > +       if (IS_ERR(lpc_snoop->clk)) {
> > +               rc = PTR_ERR(lpc_snoop->clk);
> > +               if (rc != -EPROBE_DEFER)
> > +                       dev_err(dev, "couldn't get clock\n");
> > +               return rc;
> > +       }
> > +       rc = clk_prepare_enable(lpc_snoop->clk);
> > +       if (rc) {
> > +               dev_err(dev, "couldn't enable clock\n");
> > +               return rc;
> > +       }
> > +
> >         rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
> >         if (rc)
> > -               return rc;
> > +               goto err;
> >
> >         rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 0, port);
> >         if (rc)
> > -               return rc;
> > +               goto err;
> >
> >         /* Configuration of 2nd snoop channel port is optional */
> >         if (of_property_read_u32_index(dev->of_node, "snoop-ports",
> >                                        1, &port) == 0) {
> >                 rc = aspeed_lpc_enable_snoop(lpc_snoop, dev, 1, port);
> > -               if (rc)
> > +               if (rc) {
> >                         aspeed_lpc_disable_snoop(lpc_snoop, 0);
> > +                       goto err;
> > +               }
> >         }
> >
> > +       return 0;
> > +
> > +err:
> > +       clk_disable_unprepare(lpc_snoop->clk);
> > +
> >         return rc;
> >  }
> >
> > @@ -309,6 +331,8 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
> >         aspeed_lpc_disable_snoop(lpc_snoop, 0);
> >         aspeed_lpc_disable_snoop(lpc_snoop, 1);
> >
> > +       clk_disable_unprepare(lpc_snoop->clk);
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.25.1
> >
