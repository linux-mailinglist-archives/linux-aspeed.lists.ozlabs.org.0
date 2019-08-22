Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1CA7356
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:13:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGp854PvzDqq8
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:13:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Q+bcAN9B"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Df5C47N1zDr8q
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 19:15:27 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1EAAA411F9;
 Thu, 22 Aug 2019 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1566465322; x=1568279723; bh=xp4rY3o0M1wxzRezMXTNY4/zZ
 Y+MCsy/eXZ7EF9Njsg=; b=Q+bcAN9BSsRThV9GpNDHrHQDoMM1IB3j9QOV2i2sX
 rBBn3ufrgMs7oc2FFll6f/+BoXeUG5KN7w8LxDgEvXgQ1nVAytmlaimve+VXjWpN
 KmozJuWXEWlOsrHz6y0DxBk5hAOmqQYrVHtQCUtAsJ5Cw3excV/RTCIUQKSp9j1d
 FA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3TcHeHOiQDd; Thu, 22 Aug 2019 12:15:22 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4877541240;
 Thu, 22 Aug 2019 12:15:20 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 22 Aug 2019 12:15:20 +0300
Message-ID: <a022c0590f0fbf22cc8476b5ef3f1c22746429ac.camel@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 22 Aug 2019 12:15:20 +0300
In-Reply-To: <20190821163220.GA11547@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:14 +1000
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

On Wed, 2019-08-21 at 09:32 -0700, Guenter Roeck wrote:
> 
> > +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> > +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> > +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> 
> The variable reflects the _boot status_. It should not change after booting.

Okay, then perhaps may we set 'status' handler for watchdog device and check 
'status' file? Right now 'bootstatus' and 'status' are same because there is no
handler for 'status'.

> > +
> > +	return size;
> > +}
> > +static DEVICE_ATTR_WO(access_cs0);
> > +
> > +static struct attribute *bswitch_attrs[] = {
> > +	&dev_attr_access_cs0.attr,
> > +	NULL
> > +};
> > +ATTRIBUTE_GROUPS(bswitch);
> > +
> >  static const struct watchdog_ops aspeed_wdt_ops = {
> >  	.start		= aspeed_wdt_start,
> >  	.stop		= aspeed_wdt_stop,
> > @@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device
> > *pdev)
> >  
> >  	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> >  
> > +	if (of_property_read_bool(np, "aspeed,alt-boot"))
> > +		wdt->wdd.groups = bswitch_groups;
> > +
> Why does this have to be separate to the existing evaluation of
> aspeed,alt-boot, and why does the existing code not work ?
> 
> Also, is it guaranteed that this does not interfer with existing
> support for alt-boot ?

It doesn't, it just provides for ast2400 switch to cs0 at side 1(cs1). Problem
is that only one flash chip(side 1/cs1) is accessible on alternate boot, there
is citation from the documentation in commit body. So if by some reason side 0
is corrupted, need to switch into alternate boot to cs1, do the load from it,
drop that bit to make side 0 accessible and do the flash of first side. On
ast2500/2600 this problem is solved already, in alternate boot there both flash
chips are present. It's additional requirement for alternate boot on ast2400, to
make the possibility to access at all side 0 flash chip after we boot to the
alternate side.

