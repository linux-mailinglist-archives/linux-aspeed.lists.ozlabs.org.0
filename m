Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C91265781
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 05:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnhFZ5ZsVzDqch
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 13:34:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=f7hAImC+; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnhFP4JHVzDqMt
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 13:34:17 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id c10so8520064edk.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Sep 2020 20:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rdWC82PKEhEwsaXh3LAxl47RN5F/LTuAnkpnqIreE2Q=;
 b=f7hAImC+A8EN07tWzuoorjAACjNBmgZj9nxMqSY+DSMKQiuC5kczlXpOVkgrBoMLSt
 EFCR7nxnwQhkOKl8k72xV56bOooIo3JMF0iY4Ddg4LHP1XqouEAEAF+KMEWCU/7k4LsE
 ERbh2VMLY3LELI+NF8FJ8mJZhyE4tJiJL4hT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rdWC82PKEhEwsaXh3LAxl47RN5F/LTuAnkpnqIreE2Q=;
 b=TZ4VkgsoR/f9YPD8Kr24e5mHgeWlhnyqrJ/WaAOnxy/z7350EBmZ3ELe8HR05GIVAg
 Y+i6bNawEOymx+8fWmPhz3oW9CYfMaI72ECnc6dGspNOus/lxl5CsW2Z4hTWgipt8DwZ
 Q+b4idZJbAWPxQNTq/JqHTpZiLH18ASDcmQfgPXXHGv9FjhXvav0prBouF/5N8lqPhgE
 PM42mzEoZc+y0OpFO1jWwGcpmIA9WlNvKGRTWRkRtpavf5PeYqkFYicTYEDKdAuF7c+l
 tS6clUh/x7GIhgTxQZUHnuDeU6wlHHXIaptXT+qQSEDhuTqVMOrrng+Gq6ACi/XJXLPs
 2Vmg==
X-Gm-Message-State: AOAM531Z4ZxeqNuapRquegxYqflb59te6o/EYR5ok9iPmfJLDh3Lu+wK
 4J77IQ/wmWbeS06cZt38YPMymwui3OZP+pZt+pE=
X-Google-Smtp-Source: ABdhPJzirNmav2/bABf0JzFPct9kmYu46AR/LeQQE+jKnkBIwfXqohIwEIaiJFyCSYJ6pnUxr1+sNEUyJ5DTAAnD4rk=
X-Received: by 2002:aa7:d959:: with SMTP id l25mr12310657eds.383.1599795249576; 
 Thu, 10 Sep 2020 20:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200910105440.3087723-1-andrew@aj.id.au>
 <20200910105440.3087723-3-andrew@aj.id.au>
 <CACPK8Xf-jys=F0Uqg-hYH-eDThmd5yOSNeC7+vLhra3GdOK1Zw@mail.gmail.com>
 <57d48d7a-7cea-4be7-92bd-8f3b93f84a06@www.fastmail.com>
In-Reply-To: <57d48d7a-7cea-4be7-92bd-8f3b93f84a06@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 03:33:56 +0000
Message-ID: <CACPK8XemZ2YG+nFBwy7sDoo8==YvnVYxt+1mx8QfBCxotG7K6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: sdhci-of-aspeed: Expose data sample phase delay
 tuning
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 at 02:49, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 11 Sep 2020, at 11:32, Joel Stanley wrote:
> > On Thu, 10 Sep 2020 at 10:55, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Allow sample phase adjustment to deal with layout or tolerance issues.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  drivers/mmc/host/sdhci-of-aspeed.c | 137 +++++++++++++++++++++++++++--
> > >  1 file changed, 132 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > > index 4f008ba3280e..641accbfcde4 100644
> > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c

> > > +static void
> > > +aspeed_sdc_configure_phase(struct aspeed_sdc *sdc,
> > > +                          const struct aspeed_sdhci_phase_desc *phase,
> > > +                          uint8_t value, bool enable)
> > > +{
> > > +       u32 reg;
> > > +
> > > +       spin_lock(&sdc->lock);
> >
> > What is the lock protecting against?
> >
> > We call this in the ->probe, so there should be no concurrent access going on.
>
> Because the register is in the "global" part of the SD/MMC controller address
> space (it's not part of the SDHCI), and there are multiple slots that may have
> a driver probed concurrently.

That points to having the property be part of the "global" device tree
node. This would simplify the code; you wouldn't need the locking
either.

>
> >
> >
> > > +       reg = readl(sdc->regs + ASPEED_SDC_PHASE);
> > > +       reg &= ~phase->enable_mask;
> > > +       if (enable) {
> > > +               reg &= ~phase->value_mask;
> > > +               reg |= value << __ffs(phase->value_mask);
> > > +               reg |= phase->enable_value << __ffs(phase->enable_mask);
> > > +       }
> > > +       writel(reg, sdc->regs + ASPEED_SDC_PHASE);
> > > +       spin_unlock(&sdc->lock);
> > > +}
> > > +
> > >  static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> > >  {
> > >         struct sdhci_pltfm_host *pltfm_host;
> > > @@ -155,8 +195,58 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
> > >         return (delta / 0x100) - 1;
> > >  }
> > >
> > > +static int aspeed_sdhci_configure_of(struct platform_device *pdev,
> > > +                                    struct aspeed_sdhci *sdhci)
> > > +{
> > > +       u32 iphase, ophase;
> > > +       struct device_node *np;
> > > +       struct device *dev;
> > > +       int ret;
> > > +
> > > +       if (!sdhci->phase)
> > > +               return 0;
> > > +
> > > +       dev = &pdev->dev;
> > > +       np = dev->of_node;
> > > +
> > > +       ret = of_property_read_u32(np, "aspeed,input-phase", &iphase);
> > > +       if (ret < 0) {
> > > +               aspeed_sdc_configure_phase(sdhci->parent, &sdhci->phase->in, 0,
> > > +                                          false);
> >
> > Will this clear any value that eg. u-boot writes?
>
> No, see the 'enable' test in aspeed_sdc_configure_phase()

OK, so this branch will never cause any change in the register? Best
to drop it then.

>
> >
> > The register should be left alone if the kernel doesn't have a
> > configuration of it's own, otherwise we may end up breaking an
> > otherwise working system.
>
> Right, I can rework that.
