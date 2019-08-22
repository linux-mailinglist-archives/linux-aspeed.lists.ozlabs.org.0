Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C099611
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 16:16:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DmmF5yS2zDrJl
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2019 00:16:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHwJHSCr"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DmJT2yjXzDqk8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 23:55:37 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d85so4036379pfd.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pVS9WjZ8RWCSBv6JVW5/oNJDRTIjY7tJwBPEyclsS3s=;
 b=IHwJHSCrZqwuxLg+z9PPuWxBtzeGhgAcD9jbCyNf7SVvnbEYEC7sAULbMT2EfPFyng
 9Gu6yf9O1eH34wTMSQkb3aF/w9vUZKZHXAqzau1Zs48p0Q9w0ZJI90Qx/i2B92E2BH/m
 aPAxH9UWBwnGkUXLyHcpJqvRw8GzmYZGDYi07ux6OMSttTDL7fSOevIObEPBOiGEM6Cq
 G7suHv7mIKdp15Tk4i8uRrjOH5Oh3qtPH6lxCTvPOo1Ti9O4Nlhzcj1x+Luj6OEiPDFV
 2suCvr6o6JxtVothsXeejOPG1tN3DA4OWAOosJkqclGKmUrtEx/0h4IHi/gdwB5Sz17U
 ECmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pVS9WjZ8RWCSBv6JVW5/oNJDRTIjY7tJwBPEyclsS3s=;
 b=hqTKVt/78MbpayptA01Nv7g8Khmuuf9ldGccqRTCkgJg4t8Yi/98fy50/zTTMKsaKu
 0/LB4u0yXYiKtokvQM2Y6UlKpCkMZi/f8pWxrhfFyQnMtrxgbYquWR+dZuCcmRzuS7Vy
 NqctlokJy9iRregekPrjUuoO6mhudHcoLkEbed17pDxkPhqg2ofnLbqw60C1DJLZJS6K
 Yb/drsuB+bmVZAf2aImIekjzOU30GMDzk2u739jsEZuNuKYi0TG4/UcDhqwAcnKUqXM2
 89ICYhcuQ/aQk1D5Cr47cmuPvKyIhkiYzAXpKkc1YnwAi8zTjzQq3Fl4bNwz+fa5tWFE
 ZOmw==
X-Gm-Message-State: APjAAAW52RFGv5V2WOoYPK4+IbDoyDAIGW8nzNxhM4vkdyCHaYYD5yW5
 IAHDUa4sG8JCakKk9OXk5t4CiRKf/us=
X-Google-Smtp-Source: APXvYqzUGuZQ6dNDWJuoxeDgwfknlEuPoT5poRPywocRNFuXhtyT1qaDxcSK+l4Xj7UZ6pJX7sV9IQ==
X-Received: by 2002:a17:90a:bd0b:: with SMTP id
 y11mr5304283pjr.141.1566482130453; 
 Thu, 22 Aug 2019 06:55:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e13sm33247202pfl.130.2019.08.22.06.55.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 06:55:29 -0700 (PDT)
Date: Thu, 22 Aug 2019 06:55:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
Message-ID: <20190822135528.GB8144@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <a022c0590f0fbf22cc8476b5ef3f1c22746429ac.camel@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a022c0590f0fbf22cc8476b5ef3f1c22746429ac.camel@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 12:15:20PM +0300, Ivan Mikhaylov wrote:
> On Wed, 2019-08-21 at 09:32 -0700, Guenter Roeck wrote:
> > 
> > > +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> > > +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> > > +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > 
> > The variable reflects the _boot status_. It should not change after booting.
> 
> Okay, then perhaps may we set 'status' handler for watchdog device and check 
> 'status' file? Right now 'bootstatus' and 'status' are same because there is no
> handler for 'status'.
> 

You would still have to redefine one of the status bits to mean something
driver specific. You would also still have two different flags to read
and control cs0 - to read the status, you would read an ioctl (or the
status sysfs attribute), to write it you would write into access_cs0.

I guess I must be missing something. What is the problem with using
access_cs0 for both ?

Guenter

> > > +
> > > +	return size;
> > > +}
> > > +static DEVICE_ATTR_WO(access_cs0);
> > > +
> > > +static struct attribute *bswitch_attrs[] = {
> > > +	&dev_attr_access_cs0.attr,
> > > +	NULL
> > > +};
> > > +ATTRIBUTE_GROUPS(bswitch);
> > > +
> > >  static const struct watchdog_ops aspeed_wdt_ops = {
> > >  	.start		= aspeed_wdt_start,
> > >  	.stop		= aspeed_wdt_stop,
> > > @@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device
> > > *pdev)
> > >  
> > >  	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> > >  
> > > +	if (of_property_read_bool(np, "aspeed,alt-boot"))
> > > +		wdt->wdd.groups = bswitch_groups;
> > > +
> > Why does this have to be separate to the existing evaluation of
> > aspeed,alt-boot, and why does the existing code not work ?
> > 
> > Also, is it guaranteed that this does not interfer with existing
> > support for alt-boot ?
> 
> It doesn't, it just provides for ast2400 switch to cs0 at side 1(cs1). Problem
> is that only one flash chip(side 1/cs1) is accessible on alternate boot, there
> is citation from the documentation in commit body. So if by some reason side 0
> is corrupted, need to switch into alternate boot to cs1, do the load from it,
> drop that bit to make side 0 accessible and do the flash of first side. On
> ast2500/2600 this problem is solved already, in alternate boot there both flash
> chips are present. It's additional requirement for alternate boot on ast2400, to
> make the possibility to access at all side 0 flash chip after we boot to the
> alternate side.
> 
