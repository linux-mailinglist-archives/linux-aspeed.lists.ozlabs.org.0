Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC225218C
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Aug 2020 22:05:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbg3H2VV6zDqYX
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Aug 2020 06:05:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tgbmbD+w; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbg3738rwzDqXs
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Aug 2020 06:05:36 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id p11so5009526pfn.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Aug 2020 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ONP7fZ70W2uCdTHIa7UQWtYrSdBuzbghSeSM9bNYZbY=;
 b=tgbmbD+wfpJT0QWPEnhlgQF5kw4Vo5saQ52d9A56Z8Nv6AXKi4ehf1K3DM9u/s2bgF
 dTROYbcBlMs+/ptni+PJ0GjhZPMqvtTPGtl9YPsR2U80BWlbUqbs0BvOowHLqlcwqDSb
 aMS0u/X/DRHH4mdqzt/Wiwm+TORwj6G1JoziCoNnlxN20hY6ceAGoOVoebxtTkyTsA/t
 BT1ydtHIVivdjkMaIkMLzu6VyJmeJHd/pZY7fZ09qrDetg7EnCoiZsmx6r2J3R4zPnZB
 NshksLlzD2CKL3iR00HiCu8kXf2uUVbt14A45g3Pvc9WHzqrJJX8quZr7L/tQVZb2ded
 gaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ONP7fZ70W2uCdTHIa7UQWtYrSdBuzbghSeSM9bNYZbY=;
 b=jh9Zww5TNkydeEcmMXPMW9T8UAljkR3sfQxydYdYKUTor84mXhaQWmCdtgy/cey1Dr
 426szvXNwg1V7riqgYbPWOn5MUSIobYAw5zYqfU4ri4fB7VkRVnRmOzErlxHXYog5gG5
 7SW8DryTi6aJYj5DAX6eJzkMzLPP4jS9mC3hqCpvQSTDNQXOm6tVvW+/35m22E5m6jRO
 zcyKAiE5hQwhGL1c5Bhqs0+zjRteMPkIJ8qerzLPqmPq13Hn0w9JqlxafGzGPPKLtBE3
 JFh/bQkZ/4c3WnKAcHbLHy9hXhQBFokPtE94slYC/g5+M5J1zeoFZH/SnUSmAqJQLAbq
 9+pw==
X-Gm-Message-State: AOAM533a3CwTEl9JXkNwL8KPXy27H9D4yPyu27Dr4l5lfhy7m/jPeFdw
 NRZ36wzTy9eRCgZpmwJ2bdI=
X-Google-Smtp-Source: ABdhPJxEAAm69I+hmyQ36720FaKJ62zxQBG060VTuh1WKf2H2fqvAee9Hbj4xH/b8NAs6LgrJ92sOg==
X-Received: by 2002:a62:1483:: with SMTP id 125mr8939252pfu.186.1598385931482; 
 Tue, 25 Aug 2020 13:05:31 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id g8sm59446pfo.132.2020.08.25.13.05.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 13:05:30 -0700 (PDT)
Date: Tue, 25 Aug 2020 13:05:24 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200825200523.GA22083@taoren-ubuntu-R90MNF91>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
 <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
 <8fc365dd-8a89-9e5c-ed70-093ef2bf7265@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc365dd-8a89-9e5c-ed70-093ef2bf7265@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, dmitry.torokhov@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 02:47:51PM -0500, Eddie James wrote:
> 
> On 8/25/20 1:38 AM, Joel Stanley wrote:
> > On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
> > > Mask the IRQ status to only the bits that the driver checks. This
> > > prevents excessive driver warnings when operating in slave mode
> > > when additional bits are set that the driver doesn't handle.
> > > 
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > >   drivers/i2c/busses/i2c-aspeed.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> > > index 31268074c422..abf40f2af8b4 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> > >          writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> > >                 bus->base + ASPEED_I2C_INTR_STS_REG);
> > >          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > > +       irq_received &= 0xf000ffff;
> > >          irq_remaining = irq_received;
> > This would defeat the check for irq_remaining. I don't think we want to do this.
> > 
> > Can you explain why these bits are being set in slave mode?
> 
> 
> No, I don't have any documentation for the bits that are masked off here, so
> I don't know why they would get set.
> 
> The check for irq_remaining is still useful for detecting that the driver
> state machine might be out of sync with what the master is doing.

I have a similar patch in my local tree, and the reason being: AST2600
I2C Controller may set I2CD10[25:24] to report Current Slave Parking
Status (defined in new register I2CS24) even though the new register
mode is off. The 2 bits can be ignored in legacy mode, and Ryan from
ASPEED could confirm it.


Cheers,

Tao
