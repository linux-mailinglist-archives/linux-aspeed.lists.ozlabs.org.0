Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EB277FCE
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 07:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKnN2R22zDqyb
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Sep 2020 15:13:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=UDyvjxU/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VoGq20//; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKRt3cJpzDqlS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Sep 2020 14:58:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EDD15C0159;
 Fri, 25 Sep 2020 00:58:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 25 Sep 2020 00:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=p1r4hvvh/HZ5hHKoHo2vldLLmcCyndJ
 tpv5m0DzJ4B8=; b=UDyvjxU/05rHxzd9I/oSgKccEgFjBcjPG7y7vuHUTGCBR9t
 iJLB37mgOuNHpmTmSH00Vm5hIo4Znz8OVxQnLM9ixUy9MHrAnW7Q5K8Nfz1S69at
 kuwe1MawgcPAIvawiFGOUvlc0BilX3PmAaYPEXUsljPt3vMaJCi+joT1whdpU4UJ
 EeafZWY/9NBCQ9h7uY3rXeYB+xZ7qJqiIDxWBgD17oyYyrhtgLDpN7As9TsC2WPV
 PCBkw33bbBPRkvUA6ZLjDIzQod+sq+4dN8ObwdfvVlM2/APf6RDb6gqoulBmzjlr
 2/MG3XzC/w0nbhRwU2Xnl0nL+5bMHmUP+olJ3FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p1r4hv
 vh/HZ5hHKoHo2vldLLmcCyndJtpv5m0DzJ4B8=; b=VoGq20//k9qQ+AjdLQF4Bb
 JEPauMz8Kp37HasHnLGgw+3f1lYjsKiVYBHmXQjmzPNDcpQuEFNzV5dpfWZ9mHVR
 UyJWxpIYDFcrci/+aACsZtHkxe6zmrYXiIJtbPcbTwaMAKRvhqWYBsIZfjJw/EIq
 2R3IK2YyO5nNlwIEJGKX/9zHlI4/TQtBOT6PLBPjj1pfIZa3ks7bNIch06mOZyg4
 uImmlEOWy//8vKn8S1gdJwWwoysvjdyuxqSj3GoXTachQcAE7NDHpdq06dbqVj4p
 LVKXlTENuqrpv1BHQwsqzYgx0d0IBhm6bZenuMGWaf01iWh0f83OmzhDNqJi8klw
 ==
X-ME-Sender: <xms:5HhtX_EXTvYEUUm-IN1FhQmwv0Vy2EJa5U5DnQKjhuUMruJUptYWcA>
 <xme:5HhtX8XT5GBVVcSOBGvIRz4Ph-dxXgoI0uDpP-dr8Y_FEadxdQ4rB2EfGh8VTBud7
 T9wLS9Qfwjc47ZLKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:5HhtXxKBrd6iaCUr1ZdJk6BuQu26iDw6S-0TuNN0W-fTAel1Nqf6WA>
 <xmx:5HhtX9GMUY-UDsmklum1dIWSWz97-VziiYx1QxtKhP4lIBx-SSoQGQ>
 <xmx:5HhtX1V_LJXWSpWjyyVcB9lTBKJpCe91JuYvRi2xocbfHa1FgFHt4Q>
 <xmx:5XhtX2fubnX6wdsPQ3QPz9bm6GFkguliD8ievTFrzaLfibNoniMT2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 72320E0123; Fri, 25 Sep 2020 00:58:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <720fdcf6-f332-4d17-a7d6-1c6dc2406d26@www.fastmail.com>
In-Reply-To: <CACPK8XcMiWP58vO39Fd_Qf9WZA43heMjx0eDktV3M8TGQC3HYA@mail.gmail.com>
References: <20200312121413.294384-1-joel@jms.id.au>
 <2f51b12e-3651-48e4-b733-01f41ca44b92@www.fastmail.com>
 <CACPK8XcMiWP58vO39Fd_Qf9WZA43heMjx0eDktV3M8TGQC3HYA@mail.gmail.com>
Date: Fri, 25 Sep 2020 14:27:52 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
Content-Type: text/plain
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



On Fri, 25 Sep 2020, at 14:19, Joel Stanley wrote:
> On Mon, 16 Mar 2020 at 01:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Thu, 12 Mar 2020, at 22:44, Joel Stanley wrote:
> > > The ast2600 disables the mapping of AHB memory regions by default,
> > > only allowing the LPC window to point to SPI NOR. In order to point the
> > > window to any AHB address, an ast2600 specific bit must be toggled.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  drivers/soc/aspeed/aspeed-lpc-ctrl.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > > b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > > index f4ac14c40518..142cb4cc85e7 100644
> > > --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > > +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > > @@ -22,6 +22,9 @@
> > >  #define HICR5_ENL2H  BIT(8)
> > >  #define HICR5_ENFWH  BIT(10)
> > >
> > > +#define HICR6 0x4
> >
> > Given you introduced this I assume we don't have anything else touching
> > the register, but if we ever do hopefully whoever it is that adds support is
> > conscious that they need to be doing an read/modify/write to correctly
> > clear the W1C registers without frobbing the bridge state.
> >
> > Looks like Aspeed should have introduced two bits to manage it :/
> 
> Yes, it would have been nice to have a separate register.
> 
> >
> > > +#define SW_FWH2AHB   BIT(17)
> > > +
> > >  #define HICR7 0x8
> > >  #define HICR8 0xc
> > >
> > > @@ -33,6 +36,7 @@ struct aspeed_lpc_ctrl {
> > >       resource_size_t         mem_size;
> > >       u32             pnor_size;
> > >       u32             pnor_base;
> > > +     bool                    fwh2ahb;
> > >  };
> > >
> > >  static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
> > > @@ -177,6 +181,16 @@ static long aspeed_lpc_ctrl_ioctl(struct file
> > > *file, unsigned int cmd,
> > >               if (rc)
> > >                       return rc;
> > >
> > > +             /*
> > > +              * Switch to FWH2AHB mode, AST2600 only.
> > > +              *
> > > +              * The other bits in this register are interrupt status bits
> > > +              * that are cleared by writing 1. As we don't want to clear
> > > +              * them, set only the bit of interest.
> > > +              */
> > > +             if (lpc_ctrl->fwh2ahb)
> > > +                     regmap_write(lpc_ctrl->regmap, HICR6, SW_FWH2AHB);
> > > +
> > >               /*
> > >                * Enable LPC FHW cycles. This is required for the host to
> > >                * access the regions specified.
> > > @@ -274,6 +288,9 @@ static int aspeed_lpc_ctrl_probe(struct
> > > platform_device *pdev)
> > >               return rc;
> > >       }
> > >
> > > +     if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl"))
> > > +             lpc_ctrl->fwh2ahb = true;
> > > +
> >
> > This implies that we don't want the SPI-only behaviour by default, which is
> > true for our platforms but doesn't really reflect the hardware. What are your
> > thoughts on adding an explict devicetree property? use-fwh2ahb?
> 
> I chose to do it this way as userspace that is calling the ioctl to
> set the mapping is probably expecting this behaviour. If someone in
> the future wants to enhance the driver to separate out "lpc2spi" from
> "lpc2ahb" then we could consider their patches.
> 
> The other upside of this is it maintains backwards compatibility with
> the previous SoCs.

Yep, all good.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
