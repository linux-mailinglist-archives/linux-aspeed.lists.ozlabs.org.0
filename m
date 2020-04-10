Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55A1A47B6
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Apr 2020 16:59:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zLl54LzfzDqty
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Apr 2020 00:59:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=cU+DmLkC; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zLkq1fPWzDqS8
 for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Apr 2020 00:59:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7DC1F41417;
 Fri, 10 Apr 2020 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1586530748;
 x=1588345149; bh=QW/aUtaswxl+za3c1gmqfuAg6QD/Af1ecf/UE38sKEU=; b=
 cU+DmLkCexDSeQEYeq6DIvlUuef7JmObciJ0QTUk4FeEnTRbT1GR+E1tHtDCTcOX
 s2c/oLiB/Z8W+P3SGLcA9GLYEgrWEs5Zv2sTuW7sMJqxrVZ0hogLB2lzReRuRSCn
 8mtCSPC47LERrb3eBE8OvvR0NNRTxbUOnkItnfe6cvU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KlDxzkNWdWi; Fri, 10 Apr 2020 17:59:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8487F404CF;
 Fri, 10 Apr 2020 17:59:05 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 10
 Apr 2020 17:59:05 +0300
Date: Fri, 10 Apr 2020 17:59:04 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] ARM: DTS: Aspeed: Add YADRO Nicole BMC
Message-ID: <20200410145904.GA15615@bbwork.lan>
References: <20200406101553.28958-1-a.filippov@yadro.com>
 <ad46ff33-8ce2-4ffa-b12e-204053e4f705@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ad46ff33-8ce2-4ffa-b12e-204053e4f705@www.fastmail.com>
X-Originating-IP: [172.17.14.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 10, 2020 at 02:29:47PM +0930, Andrew Jeffery wrote:
> 
> 
> > +&i2c11 {
> > +	status = "okay";
> > +};
> > +
> > +&i2c12 {
> > +	status = "okay";
> > +};
> 
> Are you accessing devices on the busses from userspace? It would
> be helpful to comment here why you're enabling all of these busses
> but not describing any devices on them, if it's necessary to enable
> them at all.
> 

Yes, some of them are unused and may be removed.
For others I'll add comments in the next version.

> > +
> > +&adc {
> > +	status = "okay";
> 
> You should specify the pinmux configuration for the channels you're using
> to ensure exclusive access to those pins (otherwise they could be exported
> e.g. as GPIOs).

It was just copied from Romulus and looks like I missed iio-hwmon-battery.
Is it what you meant?

All other pins are wired to the ground.`


Alexander
