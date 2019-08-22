Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A2A7358
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:14:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGpN2NT2zDqRJ
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:14:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="WrFYMZ73"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dmxt4Nh3zDqsM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2019 00:24:34 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 13D5142ED0;
 Thu, 22 Aug 2019 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1566483869; x=1568298270; bh=1bYRqwEu9883JdGs0AKW2xnM1
 tOirxhg2R2RAn574Yw=; b=WrFYMZ73tDcLaxuzNV0YP82ZaIl/Pp8Edk3uPxpMK
 2ELuiFrr+5kF4vHxMbil5kIVphU9p12SI+Orutc0p05tPpvMSIcSo8OVVvFg3lWf
 ZkErBrZrmQRBminqZyhRsaMlBhrLgDK7zshIKKLd3fkL+v6WWQftTyWtM8wWmBq6
 ls=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pu7N4TeU8Is4; Thu, 22 Aug 2019 17:24:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 876BC412D3;
 Thu, 22 Aug 2019 17:24:28 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 22 Aug 2019 17:24:28 +0300
Message-ID: <550d98a41f8c36effb8147201d6c5fdc762994ea.camel@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 22 Aug 2019 17:24:27 +0300
In-Reply-To: <20190822135528.GB8144@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <a022c0590f0fbf22cc8476b5ef3f1c22746429ac.camel@yadro.com>
 <20190822135528.GB8144@roeck-us.net>
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

On Thu, 2019-08-22 at 06:55 -0700, Guenter Roeck wrote:
> On Thu, Aug 22, 2019 at 12:15:20PM +0300, Ivan Mikhaylov wrote:
> > On Wed, 2019-08-21 at 09:32 -0700, Guenter Roeck wrote:
> > > > +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> > > > +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> > > > +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > > 
> > > The variable reflects the _boot status_. It should not change after
> > > booting.
> > 
> > Okay, then perhaps may we set 'status' handler for watchdog device and
> > check 
> > 'status' file? Right now 'bootstatus' and 'status' are same because there is
> > no
> > handler for 'status'.
> > 
> 
> You would still have to redefine one of the status bits to mean something
> driver specific. You would also still have two different flags to read
> and control cs0 - to read the status, you would read an ioctl (or the
> status sysfs attribute), to write it you would write into access_cs0.
> 
> I guess I must be missing something. What is the problem with using
> access_cs0 for both ?
> 
> Guenter
> 

There is no problem, I'll do that way, thanks!

