Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C6277F25
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 06:49:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKG23xvDzDqh2
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 14:49:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=L2cN3Gfr; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKFt5kbMzDqdr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Sep 2020 14:49:38 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id j2so1128946eds.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBOtWaUVwd4FMEFG+xFLngh1cbM1FZKjxm94UTWn5fQ=;
 b=L2cN3GfrcojT3KqKVj+4Clb7QbWk4kcpF7z2YcBc3kaK9QzvMYv8Ar7S2N2P/klu9t
 qKcZHIvFq9zsaRZteqbAVBIDk0IWz3D8C3eehR+ODrHdqwop6YmJpgTMr1RPiggLinDz
 cmu2tu1bI1owMN6Gh9GuB061s2xciIh9qOjao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBOtWaUVwd4FMEFG+xFLngh1cbM1FZKjxm94UTWn5fQ=;
 b=fnVjwGanyk8arYm59eawzsNfZtXYN7etlSgXbw1tEt5hqHleli6Z/by94RDXqfGzTO
 F1QwddG6asfwu1eecvPNyBWhFcMk2pXKY0SZMqeUP5ZXMom+9YJPcO1YAOBJ7W8ACMyP
 koL1OTN9/eM5Af6A/U+ZVdNtPB5k8fRR/+Go3MbR2+1fAbQRFzAccBD/AbxEyx0X1vX5
 VsN6jTpcFyL7mhaX3uOEtfiYNy2g29CGJAWIYctjFyaC4BcbGRwP8+6vbrLqzw3JlczK
 uP+RDFuJ1j0OMyagjOu7qubf/mnrZKspsSnyGS+Sd3PJLYBuvag97+2umJC1YdRNum8b
 YVUg==
X-Gm-Message-State: AOAM533bAe4zSlIt+LZxMDNrk+Z1apTQqE0NxxuwladGY6lpV0pEHDxM
 /aPR5oMXd42vdur6K163th+Gllvd8GxxJ2+UxsQ=
X-Google-Smtp-Source: ABdhPJzLNjK/bDvabqThPlfiWAKMvCD2zS/zecyWplXmSx1JeI3CUBGha4b6yeo4BOGI9Dkd6C7CDD7tTaVV4tEF9EY=
X-Received: by 2002:a50:ed02:: with SMTP id j2mr2173182eds.137.1601009373993; 
 Thu, 24 Sep 2020 21:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200312121413.294384-1-joel@jms.id.au>
 <2f51b12e-3651-48e4-b733-01f41ca44b92@www.fastmail.com>
In-Reply-To: <2f51b12e-3651-48e4-b733-01f41ca44b92@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Sep 2020 04:49:22 +0000
Message-ID: <CACPK8XcMiWP58vO39Fd_Qf9WZA43heMjx0eDktV3M8TGQC3HYA@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 16 Mar 2020 at 01:58, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 12 Mar 2020, at 22:44, Joel Stanley wrote:
> > The ast2600 disables the mapping of AHB memory regions by default,
> > only allowing the LPC window to point to SPI NOR. In order to point the
> > window to any AHB address, an ast2600 specific bit must be toggled.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > index f4ac14c40518..142cb4cc85e7 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > @@ -22,6 +22,9 @@
> >  #define HICR5_ENL2H  BIT(8)
> >  #define HICR5_ENFWH  BIT(10)
> >
> > +#define HICR6 0x4
>
> Given you introduced this I assume we don't have anything else touching
> the register, but if we ever do hopefully whoever it is that adds support is
> conscious that they need to be doing an read/modify/write to correctly
> clear the W1C registers without frobbing the bridge state.
>
> Looks like Aspeed should have introduced two bits to manage it :/

Yes, it would have been nice to have a separate register.

>
> > +#define SW_FWH2AHB   BIT(17)
> > +
> >  #define HICR7 0x8
> >  #define HICR8 0xc
> >
> > @@ -33,6 +36,7 @@ struct aspeed_lpc_ctrl {
> >       resource_size_t         mem_size;
> >       u32             pnor_size;
> >       u32             pnor_base;
> > +     bool                    fwh2ahb;
> >  };
> >
> >  static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
> > @@ -177,6 +181,16 @@ static long aspeed_lpc_ctrl_ioctl(struct file
> > *file, unsigned int cmd,
> >               if (rc)
> >                       return rc;
> >
> > +             /*
> > +              * Switch to FWH2AHB mode, AST2600 only.
> > +              *
> > +              * The other bits in this register are interrupt status bits
> > +              * that are cleared by writing 1. As we don't want to clear
> > +              * them, set only the bit of interest.
> > +              */
> > +             if (lpc_ctrl->fwh2ahb)
> > +                     regmap_write(lpc_ctrl->regmap, HICR6, SW_FWH2AHB);
> > +
> >               /*
> >                * Enable LPC FHW cycles. This is required for the host to
> >                * access the regions specified.
> > @@ -274,6 +288,9 @@ static int aspeed_lpc_ctrl_probe(struct
> > platform_device *pdev)
> >               return rc;
> >       }
> >
> > +     if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl"))
> > +             lpc_ctrl->fwh2ahb = true;
> > +
>
> This implies that we don't want the SPI-only behaviour by default, which is
> true for our platforms but doesn't really reflect the hardware. What are your
> thoughts on adding an explict devicetree property? use-fwh2ahb?

I chose to do it this way as userspace that is calling the ioctl to
set the mapping is probably expecting this behaviour. If someone in
the future wants to enhance the driver to separate out "lpc2spi" from
"lpc2ahb" then we could consider their patches.

The other upside of this is it maintains backwards compatibility with
the previous SoCs.

Cheers,

Joel
